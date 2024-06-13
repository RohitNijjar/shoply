import 'package:flutter/material.dart';
import 'package:shoply/features/auth/presentation/widgets/auth_social_button.dart';

class SocialButtonRow extends StatelessWidget {
  const SocialButtonRow({
    super.key,
    required this.path1,
    this.onTap1,
    this.onTap2,
    this.onTap3,
    required this.path2,
    required this.path3,
  });

  final String path1;
  final String path2;
  final String path3;
  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  final VoidCallback? onTap3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AuthSocialButton(
          path: 'assets/icons/google-icon.svg',
          onTap: onTap1,
        ),
        AuthSocialButton(
          path: 'assets/icons/facebook-icon.svg',
          onTap: onTap2,
        ),
        AuthSocialButton(
          path: 'assets/icons/apple-icon.svg',
          onTap: onTap3,
        ),
      ],
    );
  }
}
