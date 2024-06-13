part of 'base_cubit.dart';

@freezed
class BaseState with _$BaseState {
  const factory BaseState.initial() = Initial;
  const factory BaseState.userLoggedIn({
    required AppUser user,
  }) = UserLoggedIn;
}
