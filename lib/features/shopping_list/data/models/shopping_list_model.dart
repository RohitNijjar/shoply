// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/features/shopping_list/data/models/shopping_item_model.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';

part 'shopping_list_model.freezed.dart';

@freezed
class ShoppingListModel with _$ShoppingListModel {
  const factory ShoppingListModel({
    required String id,
    required String name,
    required List<ShoppingItemModel> shoppingItems,
    required DateTime createdAt,
  }) = _ShoppingListModel;

  const ShoppingListModel._();

  factory ShoppingListModel.fromJson(Map<String, dynamic> json, String id) {
    return ShoppingListModel(
      id: id,
      name: json['name'] as String,
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      shoppingItems: ShoppingItemModel.listFromJson(json['shoppingItems']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'shoppingItems': shoppingItems.map((item) => item.toJson()).toList(),
      'createdAt': createdAt,
    };
  }

  factory ShoppingListModel.fromDomain(ShoppingList list) {
    return ShoppingListModel(
      id: list.id,
      name: list.name,
      shoppingItems: list.shoppingItems
          .map((item) => ShoppingItemModel.fromDomain(item))
          .toList(),
      createdAt: list.createdAt ?? DateTime.now(),
    );
  }

  ShoppingList toDomain() {
    return ShoppingList(
      id: id,
      name: name,
      shoppingItems: shoppingItems.map((item) => item.toDomain()).toList(),
      createdAt: createdAt,
    );
  }

  static List<ShoppingListModel> listFromJson(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> jsonList) {
    return jsonList
        .map((json) => ShoppingListModel.fromJson(json.data(), json.id))
        .toList();
  }
}
