import 'package:shoply/features/shopping_list/domain/sorting/sorting_strategy.dart';

class ShoppingItemSorter {
  late final ISortingStrategy sortingStrategy;

  void setStrategy(ISortingStrategy strategy) {
    sortingStrategy = strategy;
  }
}
