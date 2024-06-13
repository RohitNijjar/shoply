import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoply/core/error/exceptions.dart';
import 'package:shoply/core/common/values/constants/error.dart';
import 'package:shoply/features/shopping_list/data/models/shopping_item_model.dart';

abstract interface class IShoppingItemRemoteDataSource {
  Future<void> updateShoppingItem({
    required ShoppingItemModel updatedItem,
    required String shoppingListId,
  });

  Future<List<ShoppingItemModel>> getShoppingItemsById({
    required String shoppingListId,
  });

  Future<void> deleteshoppingItem({
    required ShoppingItemModel item,
    required String shoppingListId,
  });
}

class ShoppingItemRemoteDataSource implements IShoppingItemRemoteDataSource {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> updateShoppingItem({
    required ShoppingItemModel updatedItem,
    required String shoppingListId,
  }) async {
    try {
      final shoppingListRef =
          db.collection('shoppingLists').doc(shoppingListId);

      await db.runTransaction((transaction) async {
        final shoppingListSnapshot = await transaction.get(shoppingListRef);
        final shoppingList = shoppingListSnapshot.data();

        if (shoppingList == null) {
          throw Exception('Shopping list not found');
        }

        final List<Map<String, dynamic>> existingItems =
            shoppingList['shoppingItems']?.cast<Map<String, dynamic>>() ?? [];

        final int itemIndex =
            existingItems.indexWhere((item) => item['id'] == updatedItem.id);

        if (itemIndex == -1) {
          throw Exception('Shopping Item not found');
        }
        existingItems[itemIndex] = updatedItem.toJson();

        transaction.update(shoppingListRef, {'shoppingItems': existingItems});
      });
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? Error.serverError);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ShoppingItemModel>> getShoppingItemsById({
    required String shoppingListId,
  }) async {
    try {
      final rawData =
          await db.collection('shoppingLists').doc(shoppingListId).get();

      if (!rawData.exists || rawData.data() == null) {
        return <ShoppingItemModel>[];
      }

      final data = rawData.data() as Map<String, dynamic>;
      final List<ShoppingItemModel> shoppingItems =
          ShoppingItemModel.listFromJson(data['shoppingItems'] ?? {});

      return shoppingItems;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? Error.serverError);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteshoppingItem({
    required ShoppingItemModel item,
    required String shoppingListId,
  }) async {
    try {
      await db.collection('shoppingLists').doc(shoppingListId).update({
        'shoppingItems': FieldValue.arrayRemove([item.toJson()])
      });
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? Error.serverError);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
