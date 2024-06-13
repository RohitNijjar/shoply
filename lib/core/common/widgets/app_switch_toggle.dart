import 'package:flutter/material.dart';

class AppSwitchToggle extends StatelessWidget {
  const AppSwitchToggle({
    super.key,
    required this.isOn,
    required this.label,
    required this.onChanged,
  });

  final bool isOn;
  final String label;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch.adaptive(
            value: isOn,
            onChanged: (newValue) {
              onChanged(newValue);
            }),
        const SizedBox(width: 5),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black,
              ),
        ),
      ],
    );
  }
}
