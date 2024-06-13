// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authinitial,
    required TResult Function() authloading,
    required TResult Function(AppUser user) authSuccess,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) authInvalidParam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authinitial,
    TResult? Function()? authloading,
    TResult? Function(AppUser user)? authSuccess,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? authInvalidParam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authinitial,
    TResult Function()? authloading,
    TResult Function(AppUser user)? authSuccess,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? authInvalidParam,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authinitial value) authinitial,
    required TResult Function(Authloading value) authloading,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(AuthInvalidParam value) authInvalidParam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authinitial value)? authinitial,
    TResult? Function(Authloading value)? authloading,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(AuthInvalidParam value)? authInvalidParam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authinitial value)? authinitial,
    TResult Function(Authloading value)? authloading,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(AuthInvalidParam value)? authInvalidParam,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AuthinitialImplCopyWith<$Res> {
  factory _$$AuthinitialImplCopyWith(
          _$AuthinitialImpl value, $Res Function(_$AuthinitialImpl) then) =
      __$$AuthinitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthinitialImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthinitialImpl>
    implements _$$AuthinitialImplCopyWith<$Res> {
  __$$AuthinitialImplCopyWithImpl(
      _$AuthinitialImpl _value, $Res Function(_$AuthinitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthinitialImpl implements Authinitial {
  const _$AuthinitialImpl();

  @override
  String toString() {
    return 'AuthState.authinitial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthinitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authinitial,
    required TResult Function() authloading,
    required TResult Function(AppUser user) authSuccess,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) authInvalidParam,
  }) {
    return authinitial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authinitial,
    TResult? Function()? authloading,
    TResult? Function(AppUser user)? authSuccess,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? authInvalidParam,
  }) {
    return authinitial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authinitial,
    TResult Function()? authloading,
    TResult Function(AppUser user)? authSuccess,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? authInvalidParam,
    required TResult orElse(),
  }) {
    if (authinitial != null) {
      return authinitial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authinitial value) authinitial,
    required TResult Function(Authloading value) authloading,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(AuthInvalidParam value) authInvalidParam,
  }) {
    return authinitial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authinitial value)? authinitial,
    TResult? Function(Authloading value)? authloading,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(AuthInvalidParam value)? authInvalidParam,
  }) {
    return authinitial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authinitial value)? authinitial,
    TResult Function(Authloading value)? authloading,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(AuthInvalidParam value)? authInvalidParam,
    required TResult orElse(),
  }) {
    if (authinitial != null) {
      return authinitial(this);
    }
    return orElse();
  }
}

abstract class Authinitial implements AuthState {
  const factory Authinitial() = _$AuthinitialImpl;
}

/// @nodoc
abstract class _$$AuthloadingImplCopyWith<$Res> {
  factory _$$AuthloadingImplCopyWith(
          _$AuthloadingImpl value, $Res Function(_$AuthloadingImpl) then) =
      __$$AuthloadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthloadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthloadingImpl>
    implements _$$AuthloadingImplCopyWith<$Res> {
  __$$AuthloadingImplCopyWithImpl(
      _$AuthloadingImpl _value, $Res Function(_$AuthloadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthloadingImpl implements Authloading {
  const _$AuthloadingImpl();

  @override
  String toString() {
    return 'AuthState.authloading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthloadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authinitial,
    required TResult Function() authloading,
    required TResult Function(AppUser user) authSuccess,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) authInvalidParam,
  }) {
    return authloading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authinitial,
    TResult? Function()? authloading,
    TResult? Function(AppUser user)? authSuccess,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? authInvalidParam,
  }) {
    return authloading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authinitial,
    TResult Function()? authloading,
    TResult Function(AppUser user)? authSuccess,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? authInvalidParam,
    required TResult orElse(),
  }) {
    if (authloading != null) {
      return authloading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authinitial value) authinitial,
    required TResult Function(Authloading value) authloading,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(AuthInvalidParam value) authInvalidParam,
  }) {
    return authloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authinitial value)? authinitial,
    TResult? Function(Authloading value)? authloading,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(AuthInvalidParam value)? authInvalidParam,
  }) {
    return authloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authinitial value)? authinitial,
    TResult Function(Authloading value)? authloading,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(AuthInvalidParam value)? authInvalidParam,
    required TResult orElse(),
  }) {
    if (authloading != null) {
      return authloading(this);
    }
    return orElse();
  }
}

abstract class Authloading implements AuthState {
  const factory Authloading() = _$AuthloadingImpl;
}

/// @nodoc
abstract class _$$AuthSuccessImplCopyWith<$Res> {
  factory _$$AuthSuccessImplCopyWith(
          _$AuthSuccessImpl value, $Res Function(_$AuthSuccessImpl) then) =
      __$$AuthSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AppUser user});

  $AppUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$AuthSuccessImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthSuccessImpl>
    implements _$$AuthSuccessImplCopyWith<$Res> {
  __$$AuthSuccessImplCopyWithImpl(
      _$AuthSuccessImpl _value, $Res Function(_$AuthSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$AuthSuccessImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AppUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AppUserCopyWith<$Res> get user {
    return $AppUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthSuccessImpl implements AuthSuccess {
  const _$AuthSuccessImpl(this.user);

  @override
  final AppUser user;

  @override
  String toString() {
    return 'AuthState.authSuccess(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthSuccessImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthSuccessImplCopyWith<_$AuthSuccessImpl> get copyWith =>
      __$$AuthSuccessImplCopyWithImpl<_$AuthSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authinitial,
    required TResult Function() authloading,
    required TResult Function(AppUser user) authSuccess,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) authInvalidParam,
  }) {
    return authSuccess(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authinitial,
    TResult? Function()? authloading,
    TResult? Function(AppUser user)? authSuccess,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? authInvalidParam,
  }) {
    return authSuccess?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authinitial,
    TResult Function()? authloading,
    TResult Function(AppUser user)? authSuccess,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? authInvalidParam,
    required TResult orElse(),
  }) {
    if (authSuccess != null) {
      return authSuccess(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authinitial value) authinitial,
    required TResult Function(Authloading value) authloading,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(AuthInvalidParam value) authInvalidParam,
  }) {
    return authSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authinitial value)? authinitial,
    TResult? Function(Authloading value)? authloading,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(AuthInvalidParam value)? authInvalidParam,
  }) {
    return authSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authinitial value)? authinitial,
    TResult Function(Authloading value)? authloading,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(AuthInvalidParam value)? authInvalidParam,
    required TResult orElse(),
  }) {
    if (authSuccess != null) {
      return authSuccess(this);
    }
    return orElse();
  }
}

abstract class AuthSuccess implements AuthState {
  const factory AuthSuccess(final AppUser user) = _$AuthSuccessImpl;

  AppUser get user;
  @JsonKey(ignore: true)
  _$$AuthSuccessImplCopyWith<_$AuthSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthFailureImplCopyWith<$Res> {
  factory _$$AuthFailureImplCopyWith(
          _$AuthFailureImpl value, $Res Function(_$AuthFailureImpl) then) =
      __$$AuthFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthFailureImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthFailureImpl>
    implements _$$AuthFailureImplCopyWith<$Res> {
  __$$AuthFailureImplCopyWithImpl(
      _$AuthFailureImpl _value, $Res Function(_$AuthFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthFailureImpl implements AuthFailure {
  const _$AuthFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.authFailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      __$$AuthFailureImplCopyWithImpl<_$AuthFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authinitial,
    required TResult Function() authloading,
    required TResult Function(AppUser user) authSuccess,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) authInvalidParam,
  }) {
    return authFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authinitial,
    TResult? Function()? authloading,
    TResult? Function(AppUser user)? authSuccess,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? authInvalidParam,
  }) {
    return authFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authinitial,
    TResult Function()? authloading,
    TResult Function(AppUser user)? authSuccess,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? authInvalidParam,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authinitial value) authinitial,
    required TResult Function(Authloading value) authloading,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(AuthInvalidParam value) authInvalidParam,
  }) {
    return authFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authinitial value)? authinitial,
    TResult? Function(Authloading value)? authloading,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(AuthInvalidParam value)? authInvalidParam,
  }) {
    return authFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authinitial value)? authinitial,
    TResult Function(Authloading value)? authloading,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(AuthInvalidParam value)? authInvalidParam,
    required TResult orElse(),
  }) {
    if (authFailure != null) {
      return authFailure(this);
    }
    return orElse();
  }
}

abstract class AuthFailure implements AuthState {
  const factory AuthFailure(final String message) = _$AuthFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AuthFailureImplCopyWith<_$AuthFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthInvalidParamImplCopyWith<$Res> {
  factory _$$AuthInvalidParamImplCopyWith(_$AuthInvalidParamImpl value,
          $Res Function(_$AuthInvalidParamImpl) then) =
      __$$AuthInvalidParamImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthInvalidParamImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthInvalidParamImpl>
    implements _$$AuthInvalidParamImplCopyWith<$Res> {
  __$$AuthInvalidParamImplCopyWithImpl(_$AuthInvalidParamImpl _value,
      $Res Function(_$AuthInvalidParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AuthInvalidParamImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthInvalidParamImpl implements AuthInvalidParam {
  const _$AuthInvalidParamImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.authInvalidParam(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthInvalidParamImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthInvalidParamImplCopyWith<_$AuthInvalidParamImpl> get copyWith =>
      __$$AuthInvalidParamImplCopyWithImpl<_$AuthInvalidParamImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authinitial,
    required TResult Function() authloading,
    required TResult Function(AppUser user) authSuccess,
    required TResult Function(String message) authFailure,
    required TResult Function(String message) authInvalidParam,
  }) {
    return authInvalidParam(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authinitial,
    TResult? Function()? authloading,
    TResult? Function(AppUser user)? authSuccess,
    TResult? Function(String message)? authFailure,
    TResult? Function(String message)? authInvalidParam,
  }) {
    return authInvalidParam?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authinitial,
    TResult Function()? authloading,
    TResult Function(AppUser user)? authSuccess,
    TResult Function(String message)? authFailure,
    TResult Function(String message)? authInvalidParam,
    required TResult orElse(),
  }) {
    if (authInvalidParam != null) {
      return authInvalidParam(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Authinitial value) authinitial,
    required TResult Function(Authloading value) authloading,
    required TResult Function(AuthSuccess value) authSuccess,
    required TResult Function(AuthFailure value) authFailure,
    required TResult Function(AuthInvalidParam value) authInvalidParam,
  }) {
    return authInvalidParam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Authinitial value)? authinitial,
    TResult? Function(Authloading value)? authloading,
    TResult? Function(AuthSuccess value)? authSuccess,
    TResult? Function(AuthFailure value)? authFailure,
    TResult? Function(AuthInvalidParam value)? authInvalidParam,
  }) {
    return authInvalidParam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Authinitial value)? authinitial,
    TResult Function(Authloading value)? authloading,
    TResult Function(AuthSuccess value)? authSuccess,
    TResult Function(AuthFailure value)? authFailure,
    TResult Function(AuthInvalidParam value)? authInvalidParam,
    required TResult orElse(),
  }) {
    if (authInvalidParam != null) {
      return authInvalidParam(this);
    }
    return orElse();
  }
}

abstract class AuthInvalidParam implements AuthState {
  const factory AuthInvalidParam(final String message) = _$AuthInvalidParamImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AuthInvalidParamImplCopyWith<_$AuthInvalidParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
