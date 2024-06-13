// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingList {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<ShoppingItem> get shoppingItems => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)
        $default, {
    required TResult Function(String id, String name,
            List<ShoppingItem> shoppingItems, DateTime? createdAt)
        creation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        $default, {
    TResult? Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        creation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        $default, {
    TResult Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        creation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ShoppingList value) $default, {
    required TResult Function(ShoppingListCreation value) creation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ShoppingList value)? $default, {
    TResult? Function(ShoppingListCreation value)? creation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ShoppingList value)? $default, {
    TResult Function(ShoppingListCreation value)? creation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingListCopyWith<ShoppingList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListCopyWith<$Res> {
  factory $ShoppingListCopyWith(
          ShoppingList value, $Res Function(ShoppingList) then) =
      _$ShoppingListCopyWithImpl<$Res, ShoppingList>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<ShoppingItem> shoppingItems,
      DateTime? createdAt});
}

/// @nodoc
class _$ShoppingListCopyWithImpl<$Res, $Val extends ShoppingList>
    implements $ShoppingListCopyWith<$Res> {
  _$ShoppingListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shoppingItems = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingItems: null == shoppingItems
          ? _value.shoppingItems
          : shoppingItems // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingListImplCopyWith<$Res>
    implements $ShoppingListCopyWith<$Res> {
  factory _$$ShoppingListImplCopyWith(
          _$ShoppingListImpl value, $Res Function(_$ShoppingListImpl) then) =
      __$$ShoppingListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<ShoppingItem> shoppingItems,
      DateTime? createdAt});
}

/// @nodoc
class __$$ShoppingListImplCopyWithImpl<$Res>
    extends _$ShoppingListCopyWithImpl<$Res, _$ShoppingListImpl>
    implements _$$ShoppingListImplCopyWith<$Res> {
  __$$ShoppingListImplCopyWithImpl(
      _$ShoppingListImpl _value, $Res Function(_$ShoppingListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shoppingItems = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ShoppingListImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingItems: null == shoppingItems
          ? _value._shoppingItems
          : shoppingItems // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ShoppingListImpl extends _ShoppingList {
  const _$ShoppingListImpl(
      {required this.id,
      required this.name,
      required final List<ShoppingItem> shoppingItems,
      this.createdAt})
      : _shoppingItems = shoppingItems,
        super._();

  @override
  final String id;
  @override
  final String name;
  final List<ShoppingItem> _shoppingItems;
  @override
  List<ShoppingItem> get shoppingItems {
    if (_shoppingItems is EqualUnmodifiableListView) return _shoppingItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingItems);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ShoppingList(id: $id, name: $name, shoppingItems: $shoppingItems, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._shoppingItems, _shoppingItems) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_shoppingItems), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListImplCopyWith<_$ShoppingListImpl> get copyWith =>
      __$$ShoppingListImplCopyWithImpl<_$ShoppingListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)
        $default, {
    required TResult Function(String id, String name,
            List<ShoppingItem> shoppingItems, DateTime? createdAt)
        creation,
  }) {
    return $default(id, name, shoppingItems, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        $default, {
    TResult? Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        creation,
  }) {
    return $default?.call(id, name, shoppingItems, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        $default, {
    TResult Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        creation,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id, name, shoppingItems, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ShoppingList value) $default, {
    required TResult Function(ShoppingListCreation value) creation,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ShoppingList value)? $default, {
    TResult? Function(ShoppingListCreation value)? creation,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ShoppingList value)? $default, {
    TResult Function(ShoppingListCreation value)? creation,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _ShoppingList extends ShoppingList {
  const factory _ShoppingList(
      {required final String id,
      required final String name,
      required final List<ShoppingItem> shoppingItems,
      final DateTime? createdAt}) = _$ShoppingListImpl;
  const _ShoppingList._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  List<ShoppingItem> get shoppingItems;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListImplCopyWith<_$ShoppingListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShoppingListCreationImplCopyWith<$Res>
    implements $ShoppingListCopyWith<$Res> {
  factory _$$ShoppingListCreationImplCopyWith(_$ShoppingListCreationImpl value,
          $Res Function(_$ShoppingListCreationImpl) then) =
      __$$ShoppingListCreationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<ShoppingItem> shoppingItems,
      DateTime? createdAt});
}

/// @nodoc
class __$$ShoppingListCreationImplCopyWithImpl<$Res>
    extends _$ShoppingListCopyWithImpl<$Res, _$ShoppingListCreationImpl>
    implements _$$ShoppingListCreationImplCopyWith<$Res> {
  __$$ShoppingListCreationImplCopyWithImpl(_$ShoppingListCreationImpl _value,
      $Res Function(_$ShoppingListCreationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shoppingItems = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ShoppingListCreationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      shoppingItems: null == shoppingItems
          ? _value._shoppingItems
          : shoppingItems // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$ShoppingListCreationImpl extends ShoppingListCreation {
  const _$ShoppingListCreationImpl(
      {required this.id,
      required this.name,
      required final List<ShoppingItem> shoppingItems,
      this.createdAt})
      : _shoppingItems = shoppingItems,
        super._();

  @override
  final String id;
  @override
  final String name;
  final List<ShoppingItem> _shoppingItems;
  @override
  List<ShoppingItem> get shoppingItems {
    if (_shoppingItems is EqualUnmodifiableListView) return _shoppingItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingItems);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ShoppingList.creation(id: $id, name: $name, shoppingItems: $shoppingItems, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListCreationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._shoppingItems, _shoppingItems) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_shoppingItems), createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingListCreationImplCopyWith<_$ShoppingListCreationImpl>
      get copyWith =>
          __$$ShoppingListCreationImplCopyWithImpl<_$ShoppingListCreationImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)
        $default, {
    required TResult Function(String id, String name,
            List<ShoppingItem> shoppingItems, DateTime? createdAt)
        creation,
  }) {
    return creation(id, name, shoppingItems, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        $default, {
    TResult? Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        creation,
  }) {
    return creation?.call(id, name, shoppingItems, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        $default, {
    TResult Function(String id, String name, List<ShoppingItem> shoppingItems,
            DateTime? createdAt)?
        creation,
    required TResult orElse(),
  }) {
    if (creation != null) {
      return creation(id, name, shoppingItems, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ShoppingList value) $default, {
    required TResult Function(ShoppingListCreation value) creation,
  }) {
    return creation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ShoppingList value)? $default, {
    TResult? Function(ShoppingListCreation value)? creation,
  }) {
    return creation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ShoppingList value)? $default, {
    TResult Function(ShoppingListCreation value)? creation,
    required TResult orElse(),
  }) {
    if (creation != null) {
      return creation(this);
    }
    return orElse();
  }
}

abstract class ShoppingListCreation extends ShoppingList {
  const factory ShoppingListCreation(
      {required final String id,
      required final String name,
      required final List<ShoppingItem> shoppingItems,
      final DateTime? createdAt}) = _$ShoppingListCreationImpl;
  const ShoppingListCreation._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  List<ShoppingItem> get shoppingItems;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListCreationImplCopyWith<_$ShoppingListCreationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
