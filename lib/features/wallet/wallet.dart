import 'package:apparatus_wallet/features/bridge/widgets/bridge_button.dart';
import 'package:apparatus_wallet/utils/ui_utils.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:brambldart/brambldart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const textStyle = TextStyle(color: Colors.white, fontSize: textM, fontWeight: FontWeight.w500);
const textStyleHeader = TextStyle(color: Colors.white, fontSize: textL, fontWeight: FontWeight.w500);
const textStylePage = TextStyle(color: Colors.white, fontSize: textXL, fontWeight: FontWeight.w500);

class WalletUi extends HookConsumerWidget {
  const WalletUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SelectionArea(
        child: Container(
            constraints: const BoxConstraints(minWidth: 200, maxWidth: 1200, minHeight: 400, maxHeight: 1200),
            margin: const EdgeInsets.all(32),
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: context.colors.scaffoldBackground,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              children: [
                Text("Wallet", style: textStylePage),
                verticalSpacerL,
                Text("Get started with your Apparatus Wallet", style: textStyleHeader),
                verticalSpacerL,
                Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: a2),
                    //   borderRadius: const BorderRadius.only(
                    //       bottomLeft: Radius.circular(16),
                    //       bottomRight: Radius.circular(16),
                    //       topRight: Radius.circular(16),
                    //       topLeft: Radius.circular(16)),
                    // ),
                    // padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: BridgeButton(onPressed: () {}, text: "Import Existing Wallet")),
                    horizontalSpacerL,
                    Expanded(child: BridgeButton(onPressed: () {}, text: "Create New Wallet")),
                  ],
                )),
                verticalSpacerL,
                WalletOnboarding(),
                verticalSpacerL,
                const WalletImport(),
              ],
            )));
  }
}

class WalletOnboarding extends HookConsumerWidget {
  WalletOnboarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: FutureBuilder<String>(
        future: x(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            return Text("New Mnemonic: ${snapshot.data}", style: textStyle,);
          } else {
            return const Text("No data");
          }
        },
      ),
    );
  }

  Future<String> x() async {
    const size = MnemonicSize.words12();
    final entropy = Entropy.generate(size: size);
    final x = await Phrase.fromEntropy(entropy: entropy, size: size, language: const English());
    return x.right!.value.join(" ");
  }
}

class WalletImport extends HookConsumerWidget {
  const WalletImport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TextField(
      maxLines: 1,
      textAlign: TextAlign.start,
      style: textStyle,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter your wallet seed phrase',
      ),
    );
  }
}

/// prompt for wallet

/// new or existing

/// gen new wallet

/// import from wallet

class WalletOnboardingLogic {
  void importExistingWallet() {
    // show dialog
  }

  void createNewWallet() {
    // show dialog
  }
}
