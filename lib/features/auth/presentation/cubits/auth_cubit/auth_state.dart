part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.authinitial() = Authinitial;
  const factory AuthState.authloading() = Authloading;
  const factory AuthState.authSuccess(
    AppUser user,
  ) = AuthSuccess;

  const factory AuthState.authFailure(
    String message,
  ) = AuthFailure;

  const factory AuthState.authInvalidParam(String message) = AuthInvalidParam;
}
