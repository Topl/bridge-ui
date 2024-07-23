import 'package:brambldart/brambldart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:servicekit/servicekit.dart';

part 'service_kit.freezed.dart';

part 'service_kit.g.dart';

@riverpod
class ServiceKit extends _$ServiceKit {
  @override
  Future<ServiceKitState> build() async {
    final storage = await StorageApi.init();
    return ServiceKitState.base(storage);
  }
}

@freezed
class ServiceKitState with _$ServiceKitState {
  factory ServiceKitState(
      {required StorageApi storageApi,
      required ContractStorageApi contractStorageApi,
      required FellowshipStorageApi fellowshipStorageApi,
      required WalletApi walletApi,
      required WalletStateApi walletStateApi}) = _ServiceKitState;

  factory ServiceKitState.base(StorageApi storage) {
    final contractStorage = ContractStorageApi(storage.sembast);
    final fellowshipStorage = FellowshipStorageApi(storage.sembast);
    final walletState = WalletStateApi(storage.sembast, storage.secureStorage);
    final wallet = walletState.api;
    return ServiceKitState(
        storageApi: storage,
        contractStorageApi: contractStorage,
        fellowshipStorageApi: fellowshipStorage,
        walletStateApi: walletState,
        walletApi: wallet);
  }
}
