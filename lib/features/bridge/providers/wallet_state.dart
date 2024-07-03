import 'dart:convert';

import 'package:apparatus_wallet/features/bridge/providers/rpc_channel.dart';
import 'package:biometric_storage/biometric_storage.dart';
import 'package:brambldart/brambldart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:topl_common/proto/brambl/models/address.pb.dart';

import 'package:topl_common/proto/genus/genus_models.pb.dart';
import 'package:topl_common/proto/node/services/bifrost_rpc.pbgrpc.dart';

part 'wallet_state.freezed.dart';
part 'wallet_state.g.dart';

@riverpod
class Wallet extends _$Wallet {
  @override
  Stream<WalletState> build() async* {
    // TODO: Get addresses from wallet state / vault store
    final addresses = <LockAddress>[];
    final rpcChannels = ref.watch(rpcChannelProvider);
    final nodeRpcClient = NodeRpcClient(rpcChannels.nodeRpcChannel);
    final genusRpcClient = GenusQueryAlgebra(rpcChannels.genusRpcChannel);
    final base = WalletState.base();

    await for (final _ in nodeRpcClient
        .synchronizationTraversal(SynchronizationTraversalReq())) {
      await Future.delayed(const Duration(seconds: 1));
      final utxosList = await Stream.fromIterable(addresses)
          .asyncMap((address) => genusRpcClient.queryUtxo(fromAddress: address))
          .expand((l) => l)
          .toList();
      final txos =
          Map.fromEntries(utxosList.map((u) => MapEntry(u.outputAddress, u)));
      yield base.copyWith(txos: txos);
    }
  }
}

@freezed
class WalletState with _$WalletState {
  const factory WalletState({
    required VaultStore? vaultStore,
    required Map<TransactionOutputAddress, Txo> txos,
  }) = _WalletState;

  factory WalletState.base() => const WalletState(vaultStore: null, txos: {});
}

class WalletKeyApi extends WalletKeyApiAlgebra {
  @override
  Future<Either<WalletKeyException, Unit>> deleteMainKeyVaultStore(
      String name) async {
    final store = await BiometricStorage().getStorage("$name.vault");
    await store.delete();
    return Either.right(const Unit());
  }

  @override
  Future<Either<WalletKeyException, VaultStore>> getMainKeyVaultStore(
      String name) async {
    final store = await BiometricStorage().getStorage("$name.vault");
    final data = await store.read();
    if (data == null) {
      return Either.left(WalletKeyException.vaultStoreDoesNotExist());
    }
    final decoded = jsonDecode(data);
    return VaultStore.fromJson(decoded).mapLeft(
        (e) => WalletKeyException.decodeVaultStore(context: e.toString()));
  }

  @override
  Future<Either<WalletKeyException, Unit>> saveMainKeyVaultStore(
      VaultStore mainKeyVaultStore, String name) async {
    final store = await BiometricStorage().getStorage("$name.vault");
    final data = jsonEncode(mainKeyVaultStore.toJson());
    await store.write(data);
    return Either.right(const Unit());
  }

  @override
  Future<Either<WalletKeyException, Unit>> saveMnemonic(
      List<String> mnemonic, String mnemonicName) async {
    final store = await BiometricStorage().getStorage("$mnemonicName.mnemonic");
    final data = jsonEncode(mnemonic);
    await store.write(data);
    return Either.right(const Unit());
  }

  @override
  Future<Either<WalletKeyException, Unit>> updateMainKeyVaultStore(
      VaultStore mainKeyVaultStore, String name) async {
    final store = await BiometricStorage().getStorage("$name.vault");
    final data = jsonEncode(mainKeyVaultStore.toJson());
    await store.write(data);
    return Either.right(const Unit());
  }
}
