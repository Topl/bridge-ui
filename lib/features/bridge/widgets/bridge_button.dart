import 'package:apparatus_wallet/utils/ui_utils.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';

class BridgeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;

  const BridgeButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color ?? context.colors.primary),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: TextStyle(
            color: context.textStyles.bodyLarge.color,
            fontSize: textL,
          ),
        ),
      ),
    );
  }
}
