import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/core/common/values/enums/sorting_strategies.dart';

class ShoppingItemFilters {
  SortingStrategies selectedSort;
  final Map<Category, bool> selectedCategories;
  bool hidePurchased;

  ShoppingItemFilters({
    required this.selectedSort,
    required this.selectedCategories,
    required this.hidePurchased,
  });

  factory ShoppingItemFilters.initial(Map<Category, bool> categories) =>
      ShoppingItemFilters(
        selectedSort: SortingStrategies.categoryNameAsc,
        selectedCategories: categories,
        hidePurchased: false,
      );
}
