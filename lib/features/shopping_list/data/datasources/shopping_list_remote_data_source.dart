import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoply/core/error/exceptions.dart';
import 'package:shoply/core/common/values/constants/error.dart';
import 'package:shoply/features/shopping_list/data/models/shopping_list_model.dart';

abstract interface class IShoppingListRemoteDataSource {
  Future<void> createShoppinglist({
    required ShoppingListModel shoppingList,
  });

  Future<List<ShoppingListModel>> getShoppingLists();

  Future<void> updateShoppingList(ShoppingListModel updatedShoppingList);

  Future<void> deleteShoppingList(String shoppingListId);
}

class ShoppingListRemoteDataSource implements IShoppingListRemoteDataSource {
  final db = FirebaseFirestore.instance;

  @override
  Future<void> createShoppinglist({
    required ShoppingListModel shoppingList,
  }) async {
    try {
      await db
          .collection('shoppingLists')
          .doc(shoppingList.id)
          .set(shoppingList.toJson());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? Error.serverError);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ShoppingListModel>> getShoppingLists() async {
    try {
      final rawData = await db.collection('shoppingLists').get();

      if (rawData.docs.isEmpty) {
        return <ShoppingListModel>[];
      }

      final List<ShoppingListModel> shoppingListData =
          ShoppingListModel.listFromJson(rawData.docs);

      return shoppingListData;
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? Error.serverError);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> updateShoppingList(ShoppingListModel updatedShoppingList) async {
    try {
      await db
          .collection('shoppingLists')
          .doc(updatedShoppingList.id)
          .update(updatedShoppingList.toJson());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? Error.serverError);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteShoppingList(String shoppingListId) async {
    try {
      await db.collection('shoppingLists').doc(shoppingListId).delete();
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? Error.serverError);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
