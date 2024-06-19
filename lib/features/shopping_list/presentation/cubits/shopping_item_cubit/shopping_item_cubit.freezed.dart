// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_item_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShoppingItemState {
  List<ShoppingItem> get shoppingItems => throw _privateConstructorUsedError;
  List<ShoppingItemUi> get shoppingItemsUi =>
      throw _privateConstructorUsedError;
  ShoppingItemFilters? get filters => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFailure => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  bool get itemUpdated => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingItemStateCopyWith<ShoppingItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingItemStateCopyWith<$Res> {
  factory $ShoppingItemStateCopyWith(
          ShoppingItemState value, $Res Function(ShoppingItemState) then) =
      _$ShoppingItemStateCopyWithImpl<$Res, ShoppingItemState>;
  @useResult
  $Res call(
      {List<ShoppingItem> shoppingItems,
      List<ShoppingItemUi> shoppingItemsUi,
      ShoppingItemFilters? filters,
      bool isLoading,
      bool isFailure,
      bool isSuccess,
      bool itemUpdated,
      String? message});
}

/// @nodoc
class _$ShoppingItemStateCopyWithImpl<$Res, $Val extends ShoppingItemState>
    implements $ShoppingItemStateCopyWith<$Res> {
  _$ShoppingItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingItems = null,
    Object? shoppingItemsUi = null,
    Object? filters = freezed,
    Object? isLoading = null,
    Object? isFailure = null,
    Object? isSuccess = null,
    Object? itemUpdated = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      shoppingItems: null == shoppingItems
          ? _value.shoppingItems
          : shoppingItems // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>,
      shoppingItemsUi: null == shoppingItemsUi
          ? _value.shoppingItemsUi
          : shoppingItemsUi // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItemUi>,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as ShoppingItemFilters?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      itemUpdated: null == itemUpdated
          ? _value.itemUpdated
          : itemUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShoppingItemStateImplCopyWith<$Res>
    implements $ShoppingItemStateCopyWith<$Res> {
  factory _$$ShoppingItemStateImplCopyWith(_$ShoppingItemStateImpl value,
          $Res Function(_$ShoppingItemStateImpl) then) =
      __$$ShoppingItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ShoppingItem> shoppingItems,
      List<ShoppingItemUi> shoppingItemsUi,
      ShoppingItemFilters? filters,
      bool isLoading,
      bool isFailure,
      bool isSuccess,
      bool itemUpdated,
      String? message});
}

/// @nodoc
class __$$ShoppingItemStateImplCopyWithImpl<$Res>
    extends _$ShoppingItemStateCopyWithImpl<$Res, _$ShoppingItemStateImpl>
    implements _$$ShoppingItemStateImplCopyWith<$Res> {
  __$$ShoppingItemStateImplCopyWithImpl(_$ShoppingItemStateImpl _value,
      $Res Function(_$ShoppingItemStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shoppingItems = null,
    Object? shoppingItemsUi = null,
    Object? filters = freezed,
    Object? isLoading = null,
    Object? isFailure = null,
    Object? isSuccess = null,
    Object? itemUpdated = null,
    Object? message = freezed,
  }) {
    return _then(_$ShoppingItemStateImpl(
      shoppingItems: null == shoppingItems
          ? _value._shoppingItems
          : shoppingItems // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItem>,
      shoppingItemsUi: null == shoppingItemsUi
          ? _value._shoppingItemsUi
          : shoppingItemsUi // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItemUi>,
      filters: freezed == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as ShoppingItemFilters?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFailure: null == isFailure
          ? _value.isFailure
          : isFailure // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      itemUpdated: null == itemUpdated
          ? _value.itemUpdated
          : itemUpdated // ignore: cast_nullable_to_non_nullable
              as bool,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ShoppingItemStateImpl implements _ShoppingItemState {
  const _$ShoppingItemStateImpl(
      {required final List<ShoppingItem> shoppingItems,
      required final List<ShoppingItemUi> shoppingItemsUi,
      this.filters,
      required this.isLoading,
      required this.isFailure,
      required this.isSuccess,
      required this.itemUpdated,
      this.message})
      : _shoppingItems = shoppingItems,
        _shoppingItemsUi = shoppingItemsUi;

  final List<ShoppingItem> _shoppingItems;
  @override
  List<ShoppingItem> get shoppingItems {
    if (_shoppingItems is EqualUnmodifiableListView) return _shoppingItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingItems);
  }

  final List<ShoppingItemUi> _shoppingItemsUi;
  @override
  List<ShoppingItemUi> get shoppingItemsUi {
    if (_shoppingItemsUi is EqualUnmodifiableListView) return _shoppingItemsUi;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shoppingItemsUi);
  }

  @override
  final ShoppingItemFilters? filters;
  @override
  final bool isLoading;
  @override
  final bool isFailure;
  @override
  final bool isSuccess;
  @override
  final bool itemUpdated;
  @override
  final String? message;

  @override
  String toString() {
    return 'ShoppingItemState(shoppingItems: $shoppingItems, shoppingItemsUi: $shoppingItemsUi, filters: $filters, isLoading: $isLoading, isFailure: $isFailure, isSuccess: $isSuccess, itemUpdated: $itemUpdated, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingItemStateImpl &&
            const DeepCollectionEquality()
                .equals(other._shoppingItems, _shoppingItems) &&
            const DeepCollectionEquality()
                .equals(other._shoppingItemsUi, _shoppingItemsUi) &&
            (identical(other.filters, filters) || other.filters == filters) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isFailure, isFailure) ||
                other.isFailure == isFailure) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.itemUpdated, itemUpdated) ||
                other.itemUpdated == itemUpdated) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_shoppingItems),
      const DeepCollectionEquality().hash(_shoppingItemsUi),
      filters,
      isLoading,
      isFailure,
      isSuccess,
      itemUpdated,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShoppingItemStateImplCopyWith<_$ShoppingItemStateImpl> get copyWith =>
      __$$ShoppingItemStateImplCopyWithImpl<_$ShoppingItemStateImpl>(
          this, _$identity);
}

abstract class _ShoppingItemState implements ShoppingItemState {
  const factory _ShoppingItemState(
      {required final List<ShoppingItem> shoppingItems,
      required final List<ShoppingItemUi> shoppingItemsUi,
      final ShoppingItemFilters? filters,
      required final bool isLoading,
      required final bool isFailure,
      required final bool isSuccess,
      required final bool itemUpdated,
      final String? message}) = _$ShoppingItemStateImpl;

  @override
  List<ShoppingItem> get shoppingItems;
  @override
  List<ShoppingItemUi> get shoppingItemsUi;
  @override
  ShoppingItemFilters? get filters;
  @override
  bool get isLoading;
  @override
  bool get isFailure;
  @override
  bool get isSuccess;
  @override
  bool get itemUpdated;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$ShoppingItemStateImplCopyWith<_$ShoppingItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
