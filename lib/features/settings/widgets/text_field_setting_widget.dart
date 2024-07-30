import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TextFieldSettingWidget extends HookWidget {
  final String settingsName;
  final String hintText;
  final String value;
  final void Function(String) onChanged;

  const TextFieldSettingWidget({
    super.key,
    required this.settingsName,
    required this.hintText,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController(text: value);

    return ListTile(
      title: Text(settingsName),
      trailing: SizedBox(
        width: 200,
        child: TextField(
          textAlign: TextAlign.end,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
