import 'package:collection/collection.dart';
import 'package:shoply/features/shopping_list/presentation/models/shopping_item_ui.dart';

abstract interface class IShoppingItemSort {
  List<ShoppingItemUi> sort(List<ShoppingItemUi> lists);
}

class SortByCategoryAsc implements IShoppingItemSort {
  @override
  List<ShoppingItemUi> sort(List<ShoppingItemUi> lists) {
    return lists.sorted(
      (item1, item2) => item1.category.value.compareTo(item2.category.value),
    );
  }
}

class SortByCategoryDesc implements IShoppingItemSort {
  @override
  List<ShoppingItemUi> sort(List<ShoppingItemUi> lists) {
    return lists.sorted(
      (item1, item2) => item2.category.value.compareTo(item1.category.value),
    );
  }
}

class SortByTotalPriceAsc implements IShoppingItemSort {
  @override
  List<ShoppingItemUi> sort(List<ShoppingItemUi> lists) {
    return lists.sorted(
      (item1, item2) => item1.totalPrice.compareTo(item2.totalPrice),
    );
  }
}

class SortByTotalPriceDesc implements IShoppingItemSort {
  @override
  List<ShoppingItemUi> sort(List<ShoppingItemUi> lists) {
    return lists.sorted(
      (item1, item2) => item2.totalPrice.compareTo(item1.totalPrice),
    );
  }
}
