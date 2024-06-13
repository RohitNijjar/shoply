import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/core/common/entities/user.dart';

part 'base_state.dart';
part 'base_cubit.freezed.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(const BaseState.initial()) {
    initialize();
  }

  void initialize() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        emit(const Initial());
      } else {
        emit(
          UserLoggedIn(
            user: AppUser(
              id: user.uid,
              firstName: '',
              lastName: '',
              email: user.email ?? 'email',
            ),
          ),
        );
      }
    });
  }
}
