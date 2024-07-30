import 'package:apparatus_wallet/features/bridge/providers/service_kit.dart';
import 'package:brambldart/brambldart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wallet_key_vault.g.dart';

@riverpod
class WalletKeyVault extends _$WalletKeyVault {
  @override
  Future<VaultStore> build() async {
    final serviceKit = await ref.watch(serviceKitProvider.future);

    // TODO: User provided
    final password = List.filled(32, 0);

    late VaultStore wallet;
    // First, attempt to load an existing wallet
    final loadResult = await serviceKit.walletApi.loadWallet();
    await loadResult.fold(
      // Loading a wallet may fail for a variety of reasons
      (e) async {
        // If it failed because it doesn't exist, then we can take a happy-path and create a new one.
        if (e.type == WalletApiFailureType.failedToLoadWallet) {
          final saveResult =
              (await serviceKit.walletApi.createNewWallet(password))
                  .getOrThrow();
          wallet = saveResult.mainKeyVaultStore;
          (await serviceKit.walletApi.saveWallet(wallet)).getOrThrow();
          final mainKey = serviceKit.walletApi
              .extractMainKey(wallet, password)
              .getOrThrow();
          await serviceKit.walletStateApi.initWalletState(
            NetworkConstants.privateNetworkId,
            NetworkConstants.mainLedgerId,
            mainKey.vk,
          );
          // Otherwise, if it failed for some other reason, then a wallet likely exists; it's just unparseable
          // TODO: What to do in this situation?
        } else {
          throw e;
        }
      },
      // If the wallet loaded successfully, hooray!
      (w) async => wallet = w,
    );

    return wallet;
  }
}
