import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/common/entities/user.dart';
import 'package:shoply/core/error/failure.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, AppUser>> registerWithEmailPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<Either<Failure, AppUser>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, Unit>> logoutUser();
}
