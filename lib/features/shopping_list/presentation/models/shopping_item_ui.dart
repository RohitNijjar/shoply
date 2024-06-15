import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';

class ShoppingItemUi {
  final Category category;
  final List<ShoppingItem> shoppingItems;
  final double totalPrice;

  ShoppingItemUi({
    required this.category,
    required this.shoppingItems,
    required this.totalPrice,
  });
}
