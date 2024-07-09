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

    final password = List.filled(32, 0);
    final wallet = (await serviceKit.walletApi.createAndSaveNewWallet(password))
        .getOrThrow();
    final mainKey = serviceKit.walletApi
        .extractMainKey(wallet.mainKeyVaultStore, password)
        .getOrThrow();
    await serviceKit.walletStateApi.initWalletState(
        NetworkConstants.privateNetworkId,
        NetworkConstants.mainLedgerId,
        mainKey.vk);

    Future<UtxosMap> fetchUtxos() async {
      // Get the current address from the wallet
      final encodedAddressOpt = serviceKit.walletStateApi.getCurrentAddress();
      // serviceKit.walletStateApi.getAddress("self", "default", null);
      ArgumentError.checkNotNull(encodedAddressOpt);
      final address = AddressCodecs.decode(encodedAddressOpt).getOrThrow();
      // Get the utxos associated with that address
      final utxosList = (await genusRpcClient.getTxosByLockAddress(
        QueryByLockAddressRequest(address: address, state: TxoState.UNSPENT),
      ))
          .txos;
      final utxos =
          Map.fromEntries(utxosList.map((u) => MapEntry(u.outputAddress, u)));
      return utxos;
    }

    yield await fetchUtxos();

    // For each block adoption or unadoption
    await for (final _ in nodeRpcClient
        .synchronizationTraversal(SynchronizationTraversalReq())) {
      // Wait 1 second for Genus to catch up
      await Future.delayed(const Duration(seconds: 1));
      yield await fetchUtxos();
    }
  }
}

typedef UtxosMap = Map<TransactionOutputAddress, Txo>;
