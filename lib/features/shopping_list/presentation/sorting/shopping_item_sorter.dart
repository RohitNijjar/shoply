// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shoply/features/shopping_list/presentation/models/shopping_item_ui.dart';
import 'package:shoply/features/shopping_list/presentation/sorting/shopping_item_sort.dart';

class ShoppingItemSorter {
  IShoppingItemSort currentSortingStrategy;

  ShoppingItemSorter(
    this.currentSortingStrategy,
  );

  void setSorter(IShoppingItemSort shoppingItemSort) {
    currentSortingStrategy = shoppingItemSort;
  }

  List<ShoppingItemUi> sort(List<ShoppingItemUi> lists) {
    return currentSortingStrategy.sort(lists);
  }
}
