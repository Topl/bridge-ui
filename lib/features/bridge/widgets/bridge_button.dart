import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:apparatus_wallet/constants/strings.dart';
import 'package:apparatus_wallet/features/bridge/providers/bridge_state.dart';
import 'package:apparatus_wallet/utils/ui_utils.dart';

class BridgeButton extends HookConsumerWidget {
  const BridgeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buttonText = useState(Strings.startTransfer);
    // final bridgeApi = ref.watch(bridgeProvider);
    final bridgeNotifier = ref.read(bridgeProvider.notifier);

    return ElevatedButton(
      onPressed: () {
        /// mock transfer
        bridgeNotifier.startTransfer();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(context.colors.primary),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(buttonText.value, style: TextStyle(color: context.textStyles.bodyLarge.color, fontSize: textL)),
      ),
    );
  }
}
