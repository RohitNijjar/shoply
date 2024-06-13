import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/core/common/values/enums/item_unit.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';

part 'shopping_item_model.freezed.dart';
part 'shopping_item_model.g.dart';

@freezed
class ShoppingItemModel with _$ShoppingItemModel {
  const factory ShoppingItemModel({
    required String id,
    required String name,
    required double price,
    required num quantity,
    required String unit,
    required String category,
    required bool isBought,
  }) = _ShoppingItemModel;

  const ShoppingItemModel._();

  factory ShoppingItemModel.fromJson(Map<String, Object?> json) =>
      _$ShoppingItemModelFromJson(json);

  factory ShoppingItemModel.fromDomain(ShoppingItem item) {
    return ShoppingItemModel(
      id: item.id,
      name: item.name,
      price: item.price,
      quantity: item.quantity,
      unit: item.unit.name,
      category: item.category.value,
      isBought: item.isBought,
    );
  }

  ShoppingItem toDomain() {
    return ShoppingItem(
      id: id,
      name: name,
      price: price,
      quantity: quantity,
      unit: ItemUnit.values.firstWhere((element) => element.name == unit),
      category:
          Category.values.firstWhere((element) => element.value == category),
      isBought: isBought,
    );
  }

  static List<ShoppingItemModel> listFromJson(List<dynamic> jsonList) =>
      jsonList.map((json) => ShoppingItemModel.fromJson(json)).toList();
}
