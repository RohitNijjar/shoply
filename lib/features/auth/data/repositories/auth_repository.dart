// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import 'package:shoply/core/common/entities/user.dart';
import 'package:shoply/core/error/exceptions.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:shoply/features/auth/domain/interfaces/iauth_repository.dart';

class AuthRepository implements IAuthRepository {
  IAuthRemoteDataSource authRemoteDataSource;
  AuthRepository(this.authRemoteDataSource);

  @override
  Future<Either<Failure, AppUser>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      );

      return right(user.toDomain());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, AppUser>> registerWithEmailPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.registerWithEmailPassword(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      return right(user.toDomain());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> logoutUser() async {
    try {
      await authRemoteDataSource.logoutUser();
      return right(unit);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
