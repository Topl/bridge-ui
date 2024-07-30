import 'package:flutter/material.dart';

class SliderSettingWidget extends StatelessWidget {
  final String settingsName;
  final double minValue;
  final double maxValue;
  final double currentValue;
  final void Function(double) onChanged;
  final int divisions;

  const SliderSettingWidget({
    super.key,
    required this.settingsName,
    required this.minValue,
    required this.maxValue,
    required this.currentValue,
    required this.onChanged,
    required this.divisions,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(settingsName),
      trailing: SizedBox(
        width: 250,
        child: Row(
          children: [
            Text(minValue.toStringAsFixed(0)),
            Expanded(
              child: Slider(
                value: currentValue,
                min: minValue,
                max: maxValue,
                divisions: divisions,
                label: currentValue.round().toString(),
                onChanged: onChanged,
              ),
            ),
            Text(maxValue.toStringAsFixed(0)),
          ],
        ),
      ),
    );
  }
}
