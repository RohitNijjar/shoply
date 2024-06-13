// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShoppingItemModel _$ShoppingItemModelFromJson(Map<String, dynamic> json) {
  return _ShoppingItemModel.fromJson(json);
}

/// @nodoc
mixin _$ShoppingItemModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  num get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  bool get isBought => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShoppingItemModelCopyWith<ShoppingItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemModelCopyWith<$Res> {
  factory $ShoppingItemModelCopyWith(
          ShoppingItemModel value, $Res Function(ShoppingItemModel) then) =
      _$ShoppingItemModelCopyWithImpl<$Res, ShoppingItemModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      num quantity,
      String unit,
      String category,
      bool isBought});
}

/// @nodoc
class _$ShoppingItemModelCopyWithImpl<$Res, $Val extends ShoppingItemModel>
    implements $ShoppingItemModelCopyWith<$Res> {
  _$ShoppingItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? unit = null,
    Object? category = null,
    Object? isBought = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isBought: null == isBought
          ? _value.isBought
          : isBought // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemModelImplCopyWith<$Res>
    implements $ShoppingItemModelCopyWith<$Res> {
  factory _$$ShoppingItemModelImplCopyWith(_$ShoppingItemModelImpl value,
          $Res Function(_$ShoppingItemModelImpl) then) =
      __$$ShoppingItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      double price,
      num quantity,
      String unit,
      String category,
      bool isBought});
}

/// @nodoc
class __$$ShoppingItemModelImplCopyWithImpl<$Res>
    extends _$ShoppingItemModelCopyWithImpl<$Res, _$ShoppingItemModelImpl>
    implements _$$ShoppingItemModelImplCopyWith<$Res> {
  __$$ShoppingItemModelImplCopyWithImpl(_$ShoppingItemModelImpl _value,
      $Res Function(_$ShoppingItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? unit = null,
    Object? category = null,
    Object? isBought = null,
  }) {
    return _then(_$ShoppingItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as num,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      isBought: null == isBought
          ? _value.isBought
          : isBought // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShoppingItemModelImpl extends _ShoppingItemModel {
  const _$ShoppingItemModelImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity,
      required this.unit,
      required this.category,
      required this.isBought})
      : super._();

  factory _$ShoppingItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double price;
  @override
  final num quantity;
  @override
  final String unit;
  @override
  final String category;
  @override
  final bool isBought;

  @override
  String toString() {
    return 'ShoppingItemModel(id: $id, name: $name, price: $price, quantity: $quantity, unit: $unit, category: $category, isBought: $isBought)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isBought, isBought) ||
                other.isBought == isBought));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, price, quantity, unit, category, isBought);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemModelImplCopyWith<_$ShoppingItemModelImpl> get copyWith =>
      __$$ShoppingItemModelImplCopyWithImpl<_$ShoppingItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingItemModelImplToJson(
      this,
    );
  }
}

abstract class _ShoppingItemModel extends ShoppingItemModel {
  const factory _ShoppingItemModel(
      {required final String id,
      required final String name,
      required final double price,
      required final num quantity,
      required final String unit,
      required final String category,
      required final bool isBought}) = _$ShoppingItemModelImpl;
  const _ShoppingItemModel._() : super._();

  factory _ShoppingItemModel.fromJson(Map<String, dynamic> json) =
      _$ShoppingItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get price;
  @override
  num get quantity;
  @override
  String get unit;
  @override
  String get category;
  @override
  bool get isBought;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingItemModelImplCopyWith<_$ShoppingItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
