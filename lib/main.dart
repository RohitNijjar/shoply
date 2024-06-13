import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/core/common/cubit/base_cubit.dart';
import 'package:shoply/core/theme/app_theme.dart';
import 'package:shoply/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:shoply/features/auth/presentation/screens/login.dart';
import 'package:shoply/features/tabs/app_bottom_nav_bar.dart';
import 'package:shoply/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependicies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => serviceLocator<BaseCubit>(),
      ),
      BlocProvider(
        create: (context) => serviceLocator<AuthCubit>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoply',
      theme: AppTheme.lightTheme,
      home: BlocBuilder<BaseCubit, BaseState>(
        builder: (context, state) {
          if (state is UserLoggedIn) {
            return const AppBottomNavBar();
          }

          return const LoginScreen();
        },
      ),
    );
  }
}
