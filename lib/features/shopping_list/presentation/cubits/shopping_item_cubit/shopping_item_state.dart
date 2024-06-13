part of 'shopping_item_cubit.dart';

@freezed
class ShoppingItemState with _$ShoppingItemState {
  const factory ShoppingItemState({
    required List<ShoppingItem> shoppingItems,
    required bool isLoading,
    required bool isFailure,
    required bool isSuccess,
    String? message,
  }) = _ShoppingItemState;

  factory ShoppingItemState.initial() => const _ShoppingItemState(
        shoppingItems: <ShoppingItem>[],
        isLoading: false,
        isFailure: false,
        isSuccess: false,
      );
}
