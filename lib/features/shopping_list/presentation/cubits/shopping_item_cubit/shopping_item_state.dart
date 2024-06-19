part of 'shopping_item_cubit.dart';

@freezed
class ShoppingItemState with _$ShoppingItemState {
  const factory ShoppingItemState({
    required List<ShoppingItem> shoppingItems,
    required List<ShoppingItemUi> shoppingItemsUi,
    ShoppingItemFilters? filters,
    required bool isLoading,
    required bool isFailure,
    required bool isSuccess,
    required bool itemUpdated,
    String? message,
  }) = _ShoppingItemState;

  factory ShoppingItemState.initial() => const _ShoppingItemState(
        shoppingItems: <ShoppingItem>[],
        shoppingItemsUi: <ShoppingItemUi>[],
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        itemUpdated: false,
      );
}
