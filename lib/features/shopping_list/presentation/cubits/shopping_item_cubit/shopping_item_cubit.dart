import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/core/common/values/constants/error.dart';
import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/usecases/delete_shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/usecases/get_shopping_items_by_id.dart';
import 'package:shoply/features/shopping_list/domain/usecases/update_shopping_item.dart';
import 'package:shoply/features/shopping_list/presentation/models/shopping_item_filters.dart';
import 'package:shoply/features/shopping_list/presentation/models/shopping_item_ui.dart';

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

  void initialize() async {
    await getItemsById();
    initializeItemFilters();
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
      (items) {
        final shoppingItems = getShoppingItemUi(items);
        emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            shoppingItems: items,
            shoppingItemsUi: shoppingItems,
          ),
        );
      },
    );

    _resetFlags();
  }

  Future<void> updateItemStatus(
    ShoppingItem updatedItem,
  ) async {
    final updatedItems = _updateShoppingItems(updatedItem);
    final shoppingItemUi = getShoppingItemUi(updatedItems);
    emit(
      state.copyWith(
        shoppingItems: updatedItems,
        shoppingItemsUi: shoppingItemUi,
      ),
    );

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
        final shoppingItemUi = getShoppingItemUi(shoppingItems);
        emit(
          state.copyWith(
            isLoading: false,
            isFailure: true,
            message: failure.message,
            shoppingItems: shoppingItems,
            shoppingItemsUi: shoppingItemUi,
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
      (_) {
        final shoppingItemUi = getShoppingItemUi(updatedItems);
        emit(
          state.copyWith(
            shoppingItems: updatedItems,
            shoppingItemsUi: shoppingItemUi,
            isSuccess: true,
          ),
        );
      },
    );

    _resetFlags();
  }

  Map<Category, List<ShoppingItem>> _groupItems(
    List<ShoppingItem> shoppingItems,
  ) {
    return shoppingItems.groupBy<Category>((item) => item.category);
  }

  double getTotalPrice(List<ShoppingItem> items) {
    return items.map((item) => item.calculatedPrice).sum();
  }

  List<ShoppingItem> _updateShoppingItems(ShoppingItem updatedItem) {
    return state.shoppingItems.map((item) {
      return item.id == updatedItem.id ? updatedItem : item;
    }).toList();
  }

  List<ShoppingItemUi> getShoppingItemUi(List<ShoppingItem> shoppingItems) {
    final groupedItems = _groupItems(shoppingItems);
    return groupedItems.entries.map((item) {
      return ShoppingItemUi(
        category: item.key,
        shoppingItems: item.value,
        totalPrice: getTotalPrice(item.value),
      );
    }).toList();
  }

  void initializeItemFilters() {
    Map<Category, bool> categories = <Category, bool>{
      for (var value in state.shoppingItems) value.category: true
    };

    ShoppingItemFilters filters = ShoppingItemFilters.initial(categories);
    emit(state.copyWith(filters: filters));
  }

  void filter() {
    emit(state.copyWith(isLoading: true));
    try {
      final selectedCategories = state.filters!.selectedCategories.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();

      final filteredItems = state.shoppingItems
          .where(
            (item) =>
                selectedCategories.contains(item.category) &&
                (!state.filters!.hidePurchased || !item.isBought),
          )
          .toList();
      emit(state.copyWith(isLoading: false, isSuccess: true));
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          message: Error.generalError,
        ),
      );
    } finally {
      _resetFlags();
    }
  }

  void sort(List<ShoppingItem> shoppingItems) {}

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
