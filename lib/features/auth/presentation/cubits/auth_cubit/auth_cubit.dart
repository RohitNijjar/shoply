import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/core/common/values/constants/error.dart';
import 'package:shoply/core/common/entities/user.dart';
import 'package:shoply/core/common/extensions/extensions.dart';
import 'package:shoply/core/common/validators/validator.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/auth/domain/usecases/login.dart';
import 'package:shoply/features/auth/domain/usecases/logout.dart';
import 'package:shoply/features/auth/domain/usecases/register.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this.register,
    this.login,
    this.logout,
  ) : super(const AuthState.authinitial());

  final Register register;
  final Login login;
  final Logout logout;

  Future<void> registerUser(
    String firstName,
    String lastName,
    String email,
    String password,
    String confirmPassword,
  ) async {
    emit(const AuthState.authloading());

    _validateRegisterForm(
      firstName,
      lastName,
      email,
      password,
      confirmPassword,
    );

    if (state is! AuthInvalidParam) {
      final response = await register(
        RegisterParams(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        ),
      );

      response.fold(
        (failure) => emit(AuthState.authFailure(failure.message)),
        (user) => emit(
          AuthState.authSuccess(user),
        ),
      );
    }
  }

  Future<void> loginUser(
    String email,
    String password,
  ) async {
    emit(const AuthState.authloading());
    final isEmailValid = Validator.isEmailValid(email);

    if (isEmailValid.isLeft()) {
      emit(
        AuthState.authInvalidParam(
          isEmailValid.asLeft().message,
        ),
      );
      return;
    }

    if (password.isEmpty) {
      emit(
        const AuthState.authInvalidParam(
          'Password is Invalid',
        ),
      );
      return;
    }

    final response = await login(
      LoginParams(
        email: email,
        password: password,
      ),
    );

    response.fold(
      (failure) => emit(AuthState.authFailure(failure.message)),
      (user) => emit(
        AuthState.authSuccess(user),
      ),
    );
  }

  Future<void> logoutUser() async {
    final response = await logout(NoParams());

    response.fold(
      (failure) => emit(
        AuthState.authFailure(failure.message),
      ),
      (unit) {},
    );
  }

  void _validateRegisterForm(
    String firstName,
    String lastName,
    String email,
    String password,
    String confirmPassword,
  ) {
    final isEmailValid = Validator.isEmailValid(email);
    final isPasswordValid = Validator.isPasswordValid(password);
    final isConfirmPasswordValid =
        Validator.isConfirmPasswordValid(password, confirmPassword);

    if (firstName.trim().isEmpty || lastName.trim().isEmpty) {
      emit(
        const AuthState.authInvalidParam(
          Error.invalidName,
        ),
      );
      return;
    }

    if (isEmailValid.isLeft()) {
      emit(
        AuthState.authInvalidParam(
          isEmailValid.asLeft().message,
        ),
      );
      return;
    }

    if (isPasswordValid.isLeft()) {
      emit(
        AuthState.authInvalidParam(
          isPasswordValid.asLeft().message,
        ),
      );
      return;
    }

    if (isConfirmPasswordValid.isLeft()) {
      emit(
        AuthState.authInvalidParam(
          isConfirmPasswordValid.asLeft().message,
        ),
      );
      return;
    }
  }
}
