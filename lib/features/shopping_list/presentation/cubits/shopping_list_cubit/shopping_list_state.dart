part of 'shopping_list_cubit.dart';

@freezed
class ShoppingListState with _$ShoppingListState {
  const factory ShoppingListState({
    required ShoppingList shoppingList,
    required List<ShoppingList> shoppingLists,
    required bool isLoading,
    required bool isFailure,
    required bool isSuccess,
    required bool isListSaved,
    required bool listIsEmpty,
    String? message,
  }) = _ShoppingListState;

  factory ShoppingListState.initial() => _ShoppingListState(
        shoppingList: ShoppingList.inital(),
        shoppingLists: <ShoppingList>[],
        isLoading: false,
        isFailure: false,
        isSuccess: false,
        isListSaved: false,
        listIsEmpty: false,
      );
}
