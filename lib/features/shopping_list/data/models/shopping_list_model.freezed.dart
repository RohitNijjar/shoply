// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingListModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<ShoppingItemModel> get shoppingItems =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingListModelCopyWith<ShoppingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListModelCopyWith<$Res> {
  factory $ShoppingListModelCopyWith(
          ShoppingListModel value, $Res Function(ShoppingListModel) then) =
      _$ShoppingListModelCopyWithImpl<$Res, ShoppingListModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<ShoppingItemModel> shoppingItems,
      DateTime createdAt});
}

/// @nodoc
class _$ShoppingListModelCopyWithImpl<$Res, $Val extends ShoppingListModel>
    implements $ShoppingListModelCopyWith<$Res> {
  _$ShoppingListModelCopyWithImpl(this._value, this._then);

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
    Object? createdAt = null,
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
              as List<ShoppingItemModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingListModelImplCopyWith<$Res>
    implements $ShoppingListModelCopyWith<$Res> {
  factory _$$ShoppingListModelImplCopyWith(_$ShoppingListModelImpl value,
          $Res Function(_$ShoppingListModelImpl) then) =
      __$$ShoppingListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<ShoppingItemModel> shoppingItems,
      DateTime createdAt});
}

/// @nodoc
class __$$ShoppingListModelImplCopyWithImpl<$Res>
    extends _$ShoppingListModelCopyWithImpl<$Res, _$ShoppingListModelImpl>
    implements _$$ShoppingListModelImplCopyWith<$Res> {
  __$$ShoppingListModelImplCopyWithImpl(_$ShoppingListModelImpl _value,
      $Res Function(_$ShoppingListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? shoppingItems = null,
    Object? createdAt = null,
  }) {
    return _then(_$ShoppingListModelImpl(
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
              as List<ShoppingItemModel>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ShoppingListModelImpl extends _ShoppingListModel {
  const _$ShoppingListModelImpl(
      {required this.id,
      required this.name,
      required final List<ShoppingItemModel> shoppingItems,
      required this.createdAt})
      : _shoppingItems = shoppingItems,
        super._();

  @override
  final String id;
  @override
  final String name;
  final List<ShoppingItemModel> _shoppingItems;
  @override
  List<ShoppingItemModel> get shoppingItems {
    if (_shoppingItems is EqualUnmodifiableListView) return _shoppingItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingItems);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'ShoppingListModel(id: $id, name: $name, shoppingItems: $shoppingItems, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingListModelImpl &&
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
  _$$ShoppingListModelImplCopyWith<_$ShoppingListModelImpl> get copyWith =>
      __$$ShoppingListModelImplCopyWithImpl<_$ShoppingListModelImpl>(
          this, _$identity);
}

abstract class _ShoppingListModel extends ShoppingListModel {
  const factory _ShoppingListModel(
      {required final String id,
      required final String name,
      required final List<ShoppingItemModel> shoppingItems,
      required final DateTime createdAt}) = _$ShoppingListModelImpl;
  const _ShoppingListModel._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  List<ShoppingItemModel> get shoppingItems;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingListModelImplCopyWith<_$ShoppingListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
