import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/exceptions.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/features/shopping_list/data/datasources/shopping_item_remote_data_source.dart';
import 'package:shoply/features/shopping_list/data/models/shopping_item_model.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/interfaces/ishopping_item_repository.dart';

class ShoppingItemRepository implements IShoppingItemRepository {
  final IShoppingItemRemoteDataSource shoppingItemRemoteDataSource;

  ShoppingItemRepository(this.shoppingItemRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> updateShoppingItem(
    ShoppingItem updatedItem,
    String shoppingListId,
  ) async {
    try {
      await shoppingItemRemoteDataSource.updateShoppingItem(
        updatedItem: ShoppingItemModel.fromDomain(updatedItem),
        shoppingListId: shoppingListId,
      );

      return right(unit);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, List<ShoppingItem>>> getShoppingItemsById(
    String shoppingListId,
  ) async {
    try {
      final shoppingItemModels = await shoppingItemRemoteDataSource
          .getShoppingItemsById(shoppingListId: shoppingListId);

      final List<ShoppingItem> shoppingItems =
          shoppingItemModels.map((item) => item.toDomain()).toList();

      return right(shoppingItems);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteShoppingItem(
    ShoppingItem item,
    String shoppingListId,
  ) async {
    try {
      await shoppingItemRemoteDataSource.deleteshoppingItem(
        item: ShoppingItemModel.fromDomain(item),
        shoppingListId: shoppingListId,
      );

      return right(unit);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }
}
