import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/core/common/values/enums/item_unit.dart';

part 'shopping_item.freezed.dart';

@freezed
class ShoppingItem with _$ShoppingItem {
  const factory ShoppingItem({
    required String id,
    required String name,
    required double price,
    required num quantity,
    required ItemUnit unit,
    required Category category,
    required bool isBought,
  }) = _ShoppingItem;

  const ShoppingItem._();

  factory ShoppingItem.inital() => const _ShoppingItem(
        id: '',
        name: '',
        price: 0,
        quantity: 0,
        unit: ItemUnit.pc,
        category: Category.vegetables,
        isBought: false,
      );

  double get calculatedPrice {
    return price * quantity;
  }
}
