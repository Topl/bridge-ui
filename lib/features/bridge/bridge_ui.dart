import 'package:apparatus_wallet/constants/assets.dart';
import 'package:apparatus_wallet/constants/strings.dart';
import 'package:apparatus_wallet/features/bridge/providers/bridge_state.dart';
import 'package:apparatus_wallet/features/bridge/providers/deposit_state.dart';
import 'package:apparatus_wallet/features/bridge/widgets/bridge_button.dart';
import 'package:apparatus_wallet/features/bridge/widgets/deposit/bridge_button.dart';
import 'package:apparatus_wallet/features/bridge/widgets/deposit/deposit_withdraw_selector.dart';
import 'package:apparatus_wallet/features/bridge/widgets/deposit/from_segment.dart';
import 'package:apparatus_wallet/features/bridge/widgets/deposit/info_segment.dart';
import 'package:apparatus_wallet/features/bridge/widgets/deposit/network_view.dart';
import 'package:apparatus_wallet/utils/snackbar.dart';
import 'package:apparatus_wallet/utils/ui_utils.dart';
import 'package:apparatus_wallet/utils/utils.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

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
    final bridge = ref.watch(bridgeProvider);
    final notifier = ref.read(depositProvider.notifier);

    bridge.value; // required for keeping state alive

    return SelectionArea(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 650, minHeight: 700),
        decoration: BoxDecoration(
          color: context.colors.scaffoldBackground,
          borderRadius: BorderRadius.circular(32),
        ),
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(24),
          child: deposit.when(
            data: (data) {
              switch (data.stage) {
                case Stage.start:
                  return const BridgeContent();
                case Stage.deposit:
                  return DepositContent(data);
                case Stage.waiting:
                  return const WaitingContent();
                case Stage.minted:
                  return RedeemContent(data);
                case Stage.redeem:
                // TODO: Handle this case.
                case Stage.walletCheck:
                  // TODO: Handle this case.
                  return Container();
                case Stage.done:
                  return Container();
              }
            },
            error: (error, stackTrace) {
              return Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.all(16), child: Icon(Icons.error, color: Colors.red, size: 32)),
                    Text(
                      maxLines: 10,
                      'Error: $error',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: textL,
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () {
              return Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
                    strokeWidth: 10,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class BridgeContent extends ConsumerWidget {
  const BridgeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bridgeApi = ref.watch(bridgeProvider);

    return const Column(
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
        BridgeActionButton(),
      ],
    );
  }
}

class WaitingContent extends ConsumerWidget {
  const WaitingContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 16,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            child: Text(
              'Please wait while we confirm the BTC transfer.',
              textAlign: TextAlign.center,
              style: textStyleHeader,
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
              strokeWidth: 10,
            ),
          ),
        ),
      ],
    );
  }
}

class DepositContent extends ConsumerWidget {
  final DepositState data;

  const DepositContent(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.read(depositProvider);
    final bridgeState = ref.read(bridgeProvider);
    final depositNotifier = ref.read(depositProvider.notifier);

    final qr = PrettyQrView.data(
      errorCorrectLevel: QrErrorCorrectLevel.M,
      data: data.escrowAddress!,
      decoration: PrettyQrDecoration(
        shape: PrettyQrSmoothSymbol(
          color: PrettyQrBrush.gradient(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [alt, context.colors.primary],
            ),
          ),
        ),
        image: const PrettyQrDecorationImage(
          isAntiAlias: true,
          image: Assets.apparatusImage,
        ),
      ),
    );

    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(16),
            child: const Text("Waiting for deposit", textAlign: TextAlign.center, style: textStylePage)),
        verticalSpacerL,
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: a2),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center, // Ensure text is centered within the RichText
                text: TextSpan(
                  text: 'Deposit ',
                  style: textStyleHeader,
                  children: <TextSpan>[
                    TextSpan(
                      text: '${bridgeState.value} ${bridgeState.currency.toShortString()}',
                      style: textStyleHeader.copyWith(color: context.colors.primary, fontWeight: FontWeight.w900),
                    ),
                    const TextSpan(
                      text: ' to the following address:',
                    ),
                  ],
                ),
              ),
              verticalSpacerL,
              SizedBox(
                width: 200,
                height: 200,
                child: qr,
              ),
              verticalSpacerM,
              Row(
                children: [
                  Expanded(
                    child: Text(
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        "${data.escrowAddress}",
                        style: textStyle),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: data.escrowAddress!));
                      GlobalSnackBar.show(context, 'Copied to clipboard');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpacerL,
        BridgeButton(
          onPressed: () {
            depositNotifier.btcDeposited(context);
          },
          text: "Next",
        ),
        verticalSpacerS,
        BridgeButton(
          onPressed: () {
            depositNotifier.updateStage(Stage.start);
          },
          text: "Cancel Deposit",
          color: context.colors.scaffoldBackground,
        ),
      ],
    );
  }
}

/// A scaffolded page instructing users that tBTC funds are now available in their wallet
class RedeemContent extends HookConsumerWidget {
  final DepositState data;

  const RedeemContent(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bridge = ref.watch(bridgeProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(bottom: 48, top: 16),
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: Assets.apparatusDark,
                  ),
                  const Text(Strings.apparatus, style: textStylePage),
                ],
              )),
          verticalSpacerL,
          const Text('Your funds are ready and available for transfer in your wallet.',
              textAlign: TextAlign.center, style: textStyleHeader),
          verticalSpacerL,
          BridgeButton(
              onPressed: () {
                ref.read(depositProvider.notifier).updateStage(Stage.start);
              },
              text: "Return"),
        ],
      ),
    );
  }
}

const textStyle = TextStyle(color: Colors.white, fontSize: textM, fontWeight: FontWeight.w500);
const textStyleHeader = TextStyle(color: Colors.white, fontSize: textL, fontWeight: FontWeight.w500);
const textStylePage = TextStyle(color: Colors.white, fontSize: textXL, fontWeight: FontWeight.w500);
