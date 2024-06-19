import 'package:dartx/dartx.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/core/common/values/constants/error.dart';
import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/core/common/values/enums/sorting_strategies.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/usecases/delete_shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/usecases/get_shopping_items_by_id.dart';
import 'package:shoply/features/shopping_list/domain/usecases/update_shopping_item.dart';
import 'package:shoply/features/shopping_list/presentation/models/shopping_item_filters.dart';
import 'package:shoply/features/shopping_list/presentation/models/shopping_item_ui.dart';
import 'package:shoply/features/shopping_list/presentation/sorting/shopping_item_sort.dart';
import 'package:shoply/features/shopping_list/presentation/sorting/shopping_item_sorter.dart';

part 'shopping_item_state.dart';
part 'shopping_item_cubit.freezed.dart';

class ShoppingItemCubit extends Cubit<ShoppingItemState> {
  ShoppingItemCubit(
    this.shoppingListId,
    this.updateShoppingItem,
    this.getShoppingItemsById,
    this.deleteShoppingItem,
    this.shoppingItemSorter,
  ) : super(ShoppingItemState.initial()) {
    initialize();
  }

  final ShoppingItemSorter shoppingItemSorter;
  final UpdateShoppingItem updateShoppingItem;
  final GetShoppingItemsById getShoppingItemsById;
  final DeleteShoppingItem deleteShoppingItem;
  final String shoppingListId;
  String _searchTerm = '';

  void initialize() async {
    await getItemsById();
    _initializeItemFilters();
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
        final shoppingItems = _sort(items);
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
    final filteredItems = _filter(updatedItems);
    final sortedLists = _sort(filteredItems);
    emit(
      state.copyWith(
        shoppingItems: updatedItems,
        shoppingItemsUi: sortedLists,
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
        final filteredItems = _filter(shoppingItems);
        final sortedLists = _sort(filteredItems);
        emit(
          state.copyWith(
            isLoading: false,
            isFailure: true,
            message: failure.message,
            shoppingItems: shoppingItems,
            shoppingItemsUi: sortedLists,
          ),
        );
      },
      (unit) => emit(
        state.copyWith(
          isLoading: false,
          itemUpdated: true,
          message:
              '${updatedItem.name} ${updatedItem.isBought ? 'Purchased' : 'Updated'}',
        ),
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
        final filteredItems = _filter(updatedItems);
        final sortedLists = _sort(filteredItems);
        emit(
          state.copyWith(
            shoppingItems: updatedItems,
            shoppingItemsUi: sortedLists,
            isSuccess: true,
          ),
        );
      },
    );

    _resetFlags();
  }

  void search(String searchTerm) {
    emit(state.copyWith(isLoading: true));
    try {
      _searchTerm = searchTerm;
      final searchedList = _filter(state.shoppingItems);
      final sortedList = _sort(searchedList);
      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          shoppingItemsUi: sortedList,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          message: Error.generalError,
        ),
      );
    }
  }

  void filterAndSort() {
    emit(state.copyWith(isLoading: true));
    try {
      final filteredItems = _filter(state.shoppingItems);
      final sortedLists = _sort(filteredItems);
      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          shoppingItemsUi: sortedLists,
        ),
      );
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

  double getTotalPrice(List<ShoppingItem> items) {
    return items.map((item) => item.calculatedPrice).sum();
  }

  Map<Category, List<ShoppingItem>> _groupItems(
    List<ShoppingItem> shoppingItems,
  ) {
    return shoppingItems.groupBy<Category>((item) => item.category);
  }

  List<ShoppingItem> _updateShoppingItems(ShoppingItem updatedItem) {
    return state.shoppingItems.map((item) {
      return item.id == updatedItem.id ? updatedItem : item;
    }).toList();
  }

  List<ShoppingItemUi> _getShoppingItemUi(List<ShoppingItem> shoppingItems) {
    final groupedItems = _groupItems(shoppingItems);
    return groupedItems.entries.map((item) {
      return ShoppingItemUi(
        category: item.key,
        shoppingItems: item.value,
        totalPrice: getTotalPrice(item.value),
      );
    }).toList();
  }

  void _initializeItemFilters() {
    Map<Category, bool> categories = <Category, bool>{
      for (var value in state.shoppingItems) value.category: true
    };

    ShoppingItemFilters filters = ShoppingItemFilters.initial(categories);
    emit(state.copyWith(filters: filters));
  }

  List<ShoppingItem> _filter(List<ShoppingItem> shoppingItems) {
    final selectedCategories = state.filters!.selectedCategories.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    final filteredItems = shoppingItems
        .where(
          (item) =>
              selectedCategories.contains(item.category) &&
              (!state.filters!.hidePurchased || !item.isBought) &&
              (_searchTerm.isNotBlank
                  ? item.name.toLowerCase().contains(_searchTerm.toLowerCase())
                  : !_searchTerm.isNotBlank),
        )
        .toList();
    return filteredItems;
  }

  List<ShoppingItemUi> _sort(List<ShoppingItem> shoppingItems) {
    final shoppingItemUi = _getShoppingItemUi(shoppingItems);
    if (state.filters != null) {
      switch (state.filters!.selectedSort) {
        case SortingStrategies.categoryNameAsc:
          shoppingItemSorter.setSorter(SortByCategoryAsc());
          break;
        case SortingStrategies.categortNameDesc:
          shoppingItemSorter.setSorter(SortByCategoryDesc());
        case SortingStrategies.categoryPriceAsc:
          shoppingItemSorter.setSorter(SortByTotalPriceAsc());
        case SortingStrategies.categoryPriceDesc:
          shoppingItemSorter.setSorter(SortByTotalPriceDesc());
        default:
          shoppingItemSorter.setSorter(SortByCategoryAsc());
      }
    }

    final sorted = shoppingItemSorter.sort(shoppingItemUi);
    return sorted;
  }

  void _resetFlags() {
    emit(
      state.copyWith(
        isFailure: false,
        isLoading: false,
        isSuccess: false,
        itemUpdated: false,
        message: null,
      ),
    );
  }
}
