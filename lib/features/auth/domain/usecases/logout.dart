import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/auth/domain/interfaces/iauth_repository.dart';

class Logout implements UseCase<Unit, NoParams> {
  final IAuthRepository authRepository;

  Logout(this.authRepository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async =>
      await authRepository.logoutUser();
}
