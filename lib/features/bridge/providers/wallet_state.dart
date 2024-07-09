import 'package:apparatus_wallet/features/bridge/providers/rpc_channel.dart';
import 'package:apparatus_wallet/features/bridge/providers/service_kit.dart';
import 'package:brambldart/brambldart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topl_common/proto/brambl/models/address.pb.dart';

import 'package:topl_common/proto/genus/genus_models.pb.dart';
import 'package:topl_common/proto/genus/genus_rpc.pbgrpc.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pbgrpc.dart';

part 'wallet_state.g.dart';

@riverpod
class WalletUtxos extends _$WalletUtxos {
  @override
  Stream<UtxosMap> build() async* {
    final serviceKit = await ref.watch(serviceKitProvider.future);
    final rpcChannels = ref.watch(rpcChannelProvider);
    final nodeRpcClient = NodeRpcClient(rpcChannels.nodeRpcChannel);
    final genusRpcClient =
        TransactionServiceClient(rpcChannels.genusRpcChannel);

    // TODO: User provided
    final password = List.filled(32, 0);
    // TODO: Load existing
    final wallet =
        (await serviceKit.walletApi.createNewWallet(password)).getOrThrow();
    (await serviceKit.walletApi.saveWallet(wallet.mainKeyVaultStore))
        .getOrThrow();
    final mainKey = serviceKit.walletApi
        .extractMainKey(wallet.mainKeyVaultStore, password)
        .getOrThrow();
    try {
      await serviceKit.walletStateApi.initWalletState(
        NetworkConstants.privateNetworkId,
        NetworkConstants.mainLedgerId,
        mainKey.vk,
      );
    } catch (e) {
      print(e);
      rethrow;
    }
    final encodedGenesisAddress =
        serviceKit.walletStateApi.getAddress("nofellowship", "genesis", 1)!;
    final genesisAddress =
        AddressCodecs.decode(encodedGenesisAddress).getOrThrow();
    final genesisLock =
        serviceKit.walletStateApi.getLock("nofellowship", "genesis", 1)!;

    Future<UtxosMap> fetchUtxos() async {
      // Get the current address from the wallet
      final encodedAddress = serviceKit.walletStateApi.getCurrentAddress();
      final address = AddressCodecs.decode(encodedAddress).getOrThrow();
      final utxosList = [
        ...(await genusRpcClient.getTxosByLockAddress(QueryByLockAddressRequest(
                address: address, state: TxoState.UNSPENT)))
            .txos,
        // In addition to the local wallet's funds, also fetch the public genesis funds
        ...(await genusRpcClient.getTxosByLockAddress(QueryByLockAddressRequest(
                address: genesisAddress, state: TxoState.UNSPENT)))
            .txos,
      ];
      final utxos =
          Map.fromEntries(utxosList.map((u) => MapEntry(u.outputAddress, u)));
      return utxos;
    }

    try {
      yield await fetchUtxos();
    } catch (e) {
      print(e);
      rethrow;
    }

    // For each block adoption or unadoption
    await for (final _ in nodeRpcClient
        .synchronizationTraversal(SynchronizationTraversalReq())) {
      try {
        // Wait 1 second for Genus to catch up
        await Future.delayed(const Duration(seconds: 1));
        yield await fetchUtxos();
      } catch (e) {
        print(e);
        rethrow;
      }
    }
  }
}

typedef UtxosMap = Map<TransactionOutputAddress, Txo>;
