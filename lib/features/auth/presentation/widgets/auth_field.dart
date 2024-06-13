import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shoply/core/theme/app_palette.dart';

class AuthField extends StatefulWidget {
  const AuthField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? textInputType;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.textInputType == TextInputType.visiblePassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: AppPalette.fieldIconColor,
          size: 22.0,
        ),
        suffixIcon: widget.textInputType == TextInputType.visiblePassword
            ? IconButton(
                icon: Icon(
                  isObscure ? FeatherIcons.eye : FeatherIcons.eyeOff,
                  color: AppPalette.fieldIconColor,
                  size: 22.0,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
      ),
      obscureText: isObscure,
    );
  }
}
