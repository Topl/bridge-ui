import 'package:flutter/material.dart';

class CheckboxSettingWidget extends StatelessWidget {
  final String settingsName;
  final bool value;
  final void Function(bool?) onChanged;

  const CheckboxSettingWidget({
    super.key,
    required this.settingsName,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(settingsName),
      trailing: Checkbox(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
