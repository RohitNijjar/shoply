import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/common/entities/user.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/auth/domain/interfaces/iauth_repository.dart';

class Login implements UseCase<AppUser, LoginParams> {
  final IAuthRepository authRepository;

  Login(this.authRepository);

  @override
  Future<Either<Failure, AppUser>> call(LoginParams params) async =>
      await authRepository.loginWithEmailPassword(
        email: params.email,
        password: params.password,
      );
}

class LoginParams {
  String email;
  String password;

  LoginParams({
    required this.email,
    required this.password,
  });
}
