import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/usecases/delete_shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/usecases/get_shopping_items_by_id.dart';
import 'package:shoply/features/shopping_list/domain/usecases/update_shopping_item.dart';

part 'shopping_item_state.dart';
part 'shopping_item_cubit.freezed.dart';

class ShoppingItemCubit extends Cubit<ShoppingItemState> {
  ShoppingItemCubit(
    this.shoppingListId,
    this.updateShoppingItem,
    this.getShoppingItemsById,
    this.deleteShoppingItem,
  ) : super(ShoppingItemState.initial()) {
    initialize();
  }

  final UpdateShoppingItem updateShoppingItem;
  final GetShoppingItemsById getShoppingItemsById;
  final DeleteShoppingItem deleteShoppingItem;
  final String shoppingListId;

  void initialize() {
    getItemsById();
  }

  Future<void> getItemsById() async {
    emit(state.copyWith(isLoading: true));
    final response = await getShoppingItemsById(shoppingListId);

    response.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          message: failure.message,
        ),
      ),
      (items) => emit(
        state.copyWith(isLoading: false, isSuccess: true, shoppingItems: items),
      ),
    );

    _resetFlags();
  }

  Future<void> updateItemStatus(
    ShoppingItem updatedItem,
  ) async {
    final updatedItems = _updateShoppingItems(updatedItem);

    emit(state.copyWith(shoppingItems: updatedItems));

    final response = await updateShoppingItem(
      UpdateShoppingItemParams(
        updatedItem: updatedItem,
        shoppingListId: shoppingListId,
      ),
    );

    response.fold(
      (failure) {
        final shoppingItems =
            _updateShoppingItems(updatedItem.copyWith(isBought: false));
        emit(
          state.copyWith(
            isLoading: false,
            isFailure: true,
            message: failure.message,
            shoppingItems: shoppingItems,
          ),
        );
      },
      (unit) => emit(
        state.copyWith(isLoading: false, isSuccess: true),
      ),
    );

    _resetFlags();
  }

  Future<void> deleteItem(ShoppingItem item) async {
    final String shoppingItemId = item.id;
    final updatedItems = state.shoppingItems
        .filter((item) => item.id != shoppingItemId)
        .toList();

    final response = await deleteShoppingItem(
      DeleteShoppingItemParams(
        item: item,
        shoppingListId: shoppingListId,
      ),
    );

    response.fold(
      (failure) =>
          emit(state.copyWith(message: failure.message, isFailure: true)),
      (_) => emit(
        state.copyWith(shoppingItems: updatedItems, isSuccess: true),
      ),
    );

    _resetFlags();
  }

  Map<Category, List<ShoppingItem>> get categorizedItems {
    return state.shoppingItems.groupBy<Category>((item) => item.category);
  }

  double getTotalPrice(List<ShoppingItem> items) {
    return items.map((item) => item.calculatedPrice).sum();
  }

  List<ShoppingItem> _updateShoppingItems(ShoppingItem updatedItem) {
    return state.shoppingItems.map((item) {
      return item.id == updatedItem.id ? updatedItem : item;
    }).toList();
  }

  void _resetFlags() {
    emit(
      state.copyWith(
        isFailure: false,
        isLoading: false,
        isSuccess: false,
        message: null,
      ),
    );
  }
}
