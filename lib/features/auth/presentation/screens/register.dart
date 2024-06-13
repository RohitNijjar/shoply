import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shoply/core/common/dialogs/dailogs.dart';
import 'package:shoply/core/common/widgets/loader.dart';
import 'package:shoply/core/theme/app_palette.dart';
import 'package:shoply/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:shoply/features/auth/presentation/widgets/auth_field.dart';
import 'package:shoply/features/auth/presentation/widgets/social_button_row.dart';
import 'package:shoply/features/tabs/app_bottom_nav_bar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FeatherIcons.arrowLeft,
            color: Theme.of(context).colorScheme.onSecondary,
            size: 30.0,
          ),
        ),
        title: Text(
          'Register',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        titleSpacing: 0,
      ),
      body: SingleChildScrollView(
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

            return Container(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 60),
              width: double.infinity,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    SocialButtonRow(
                      path1: 'assets/icons/google-icon.svg',
                      onTap1: () {},
                      path2: 'assets/icons/facebook-icon.svg',
                      onTap2: () {},
                      path3: 'assets/icons/apple-icon.svg',
                      onTap3: () {},
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
                    AuthField(
                      controller: firstNameController,
                      hintText: 'First Name',
                      prefixIcon: FeatherIcons.user,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 30),
                    AuthField(
                      controller: lastNameController,
                      hintText: 'Last Name',
                      prefixIcon: FeatherIcons.user,
                      textInputType: TextInputType.emailAddress,
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
                    const SizedBox(height: 30),
                    AuthField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      prefixIcon: FeatherIcons.key,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 150),
                    ElevatedButton(
                      onPressed: state is Authloading
                          ? null
                          : () {
                              context.read<AuthCubit>().registerUser(
                                    firstNameController.text,
                                    lastNameController.text,
                                    emailController.text,
                                    passwordController.text,
                                    confirmPasswordController.text,
                                  );
                            },
                      child: const Text('Register'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
