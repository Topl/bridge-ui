import 'package:flutter/material.dart';

class DropDownSettingWidget extends StatelessWidget {
  final String settingsName;
  final String defaultSettingsValue;
  final void Function(String) settingsCallback;
  final String value;
  final List<String> items;

  const DropDownSettingWidget({
    super.key,
    required this.settingsName,
    required this.defaultSettingsValue,
    required this.settingsCallback,
    required this.value,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(settingsName),
      trailing: DropdownButton<String>(
        value: value,
        onChanged: (String? newValue) {
          settingsCallback(newValue!);
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
