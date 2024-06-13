import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/core/common/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromDomain(AppUser user) {
    return UserModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
    );
  }

  AppUser toDomain() {
    return AppUser(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
    );
  }
}
