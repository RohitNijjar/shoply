import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoply/core/common/values/constants/error.dart';
import 'package:shoply/core/error/exceptions.dart';
import 'package:shoply/features/auth/data/models/user_model.dart';

abstract interface class IAuthRemoteDataSource {
  Future<UserModel> registerWithEmailPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });

  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<void> logoutUser();
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredentials.user == null) {
        throw const ServerException(Error.serverError);
      }

      final rawData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredentials.user!.uid)
          .get();

      if (rawData.data() == null) {
        throw const ServerException(Error.serverError);
      }

      final json = {
        'id': userCredentials.user!.uid,
        ...rawData.data()!,
      };

      return UserModel.fromJson(json);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw const ServerException(Error.incorrectCredentials);
      }
      throw ServerException(e.message ?? Error.serverError);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> registerWithEmailPassword({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final userCredentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredentials.user == null) {
        throw const ServerException(Error.serverError);
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredentials.user!.uid)
          .set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      });

      return UserModel(
        id: userCredentials.user!.uid,
        firstName: firstName,
        lastName: lastName,
        email: userCredentials.user!.email ?? email,
      );
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? Error.serverError);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      return;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? Error.serverError);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
