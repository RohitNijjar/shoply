import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/core/common/extensions/extensions.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';

part 'shopping_list.freezed.dart';

@freezed
class ShoppingList with _$ShoppingList {
  const factory ShoppingList({
    required String id,
    required String name,
    required List<ShoppingItem> shoppingItems,
    DateTime? createdAt,
  }) = _ShoppingList;

  const ShoppingList._();

  const factory ShoppingList.creation({
    required String id,
    required String name,
    required List<ShoppingItem> shoppingItems,
    DateTime? createdAt,
  }) = ShoppingListCreation;

  factory ShoppingList.inital() {
    return const ShoppingList.creation(
      id: '',
      name: '',
      shoppingItems: [],
    );
  }

  String get totalPrice {
    final totalPrice = shoppingItems.map((item) => item.calculatedPrice).sum();
    return totalPrice.inMoneyFormat('PHP');
  }
}
