// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/common/entities/user.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/auth/domain/interfaces/iauth_repository.dart';

class Register implements UseCase<AppUser, RegisterParams> {
  final IAuthRepository authRepository;

  Register(this.authRepository);

  @override
  Future<Either<Failure, AppUser>> call(RegisterParams params) async =>
      await authRepository.registerWithEmailPassword(
        firstName: params.firstName,
        lastName: params.lastName,
        email: params.email,
        password: params.password,
      );
}

class RegisterParams {
  String firstName;
  String lastName;
  String email;
  String password;

  RegisterParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
}
