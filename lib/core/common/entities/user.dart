import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) = _AppUser;

  const AppUser._();
}
