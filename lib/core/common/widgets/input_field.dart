import 'package:flutter/material.dart';
import 'package:shoply/core/theme/app_palette.dart';

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          prefixIcon,
          color: AppPalette.fieldIconColor,
          size: 22.0,
        ),
      ),
    );
  }
}
