import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoply/core/common/dialogs/dailogs.dart';
import 'package:shoply/core/common/widgets/loader.dart';
import 'package:shoply/core/theme/app_palette.dart';
import 'package:shoply/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:shoply/features/auth/presentation/screens/register.dart';
import 'package:shoply/features/auth/presentation/widgets/auth_field.dart';
import 'package:shoply/features/auth/presentation/widgets/social_button_row.dart';
import 'package:shoply/features/tabs/app_bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthInvalidParam) {
              Dialogs.showSnackBar(context, state.message);
            }

            if (state is AuthFailure) {
              Dialogs.showSnackBar(context, state.message);
            }

            if (state is AuthSuccess) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const AppBottomNavBar(),
                ),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            if (state is Authloading) {
              return const Loader();
            }

            return SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                width: double.infinity,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SvgPicture.asset(
                        'assets/images/sign_in.svg',
                        width: 280,
                      ),
                      const SizedBox(height: 50),
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 30),
                      AuthField(
                        controller: emailController,
                        hintText: 'Email Id',
                        prefixIcon: FeatherIcons.atSign,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 30),
                      AuthField(
                        controller: passwordController,
                        hintText: 'Password',
                        prefixIcon: FeatherIcons.key,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 5),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            foregroundColor: AppPalette.white1,
                          ),
                          child: Text(
                            'Forgot Password?',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppPalette.accentColor,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().loginUser(
                                emailController.text.trim(),
                                passwordController.text.trim(),
                              );
                        },
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 25),
                      Text(
                        'or',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppPalette.blueGrey.withAlpha(255),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25),
                      SocialButtonRow(
                        path1: 'assets/icons/google-icon.svg',
                        onTap1: () {
                          print('Google');
                        },
                        path2: 'assets/icons/facebook-icon.svg',
                        onTap2: () {
                          print('Facebook');
                        },
                        path3: 'assets/icons/apple-icon.svg',
                        onTap3: () {
                          print('Apple');
                        },
                      ),
                      const SizedBox(height: 50),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'New to the App? ',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppPalette.textColor,
                                  ),
                          children: [
                            TextSpan(
                              text: 'Register',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppPalette.accentColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ),
                                  );
                                },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
