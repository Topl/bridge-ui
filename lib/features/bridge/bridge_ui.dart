import 'package:apparatus_wallet/features/bridge/providers/bridge_state.dart';
import 'package:apparatus_wallet/features/bridge/providers/deposit_state.dart';
import 'package:apparatus_wallet/features/bridge/widgets/bridge_button.dart';
import 'package:apparatus_wallet/features/bridge/widgets/deposit_withdraw_selector.dart';
import 'package:apparatus_wallet/features/bridge/widgets/from_segment.dart';
import 'package:apparatus_wallet/features/bridge/widgets/info_segment.dart';
import 'package:apparatus_wallet/features/bridge/widgets/network_view.dart';
import 'package:apparatus_wallet/utils/ui_utils.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BridgeUi extends ConsumerWidget {
  const BridgeUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return Scaffold(
    //   backgroundColor: bkg,
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //     title: Row(
    //       children: [
    //         SizedBox(
    //           width: 64,
    //           height: 64,
    //           child: Assets.apparatusWhite,
    //         ),
    //         Text("Apparatus Demo", style: TextStyle(color: context.colors)),
    //       ],
    //     ),
    //   ),
    //   body:
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BridgeDepositLoader(),
          // BridgeContent(),
        ],
        // ),
      ),
    );
  }
}

class BridgeDepositLoader extends HookConsumerWidget {
  const BridgeDepositLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deposit = ref.watch(depositProvider);
    final notifier = ref.read(depositProvider.notifier);

    return deposit.when(
      data: (data) {
        switch (data.stage) {
          case Stage.deposit:
            return const BridgeContent();
          case Stage.sendToEscrow:
          // TODO: Handle this case.
          case Stage.minting:
          // TODO: Handle this case.
          case Stage.readyToRedeem:
          // TODO: Handle this case.
          case Stage.walletCheck:
          // TODO: Handle this case.
          case Stage.redeem:
            // TODO: Handle this case.
            return Container();
        }
      },
      error: (error, stackTrace) => const Center(child: Text("Failed")),
      loading: () => const Center(child: Text("Loading")),
    );
  }
}

class BridgeContent extends ConsumerWidget {
  const BridgeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bridgeApi = ref.watch(bridgeProvider);

    return SelectionArea(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 650),
        // margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colors.scaffoldBackground,
          borderRadius: BorderRadius.circular(32),
        ),
        width: double.infinity,
        // height: 800,
        child: Container(
            margin: const EdgeInsets.all(24),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: !bridgeApi.loading,
                  child: const Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      DepositWithdrawSelector(),
                      verticalSpacerL,
                      NetworkView(),
                      verticalSpacerL,
                      FromSegment(),
                      verticalSpacerL,
                      InfoSegment(),
                      verticalSpacerL,
                      BridgeButton(),
                    ],
                  ),
                ),
                Visibility(
                  visible: bridgeApi.loading, // When loading, show the spinner
                  child: Center(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
                        strokeWidth: 10,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
