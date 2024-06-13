import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';

abstract interface class IShoppingItemRepository {
  Future<Either<Failure, Unit>> updateShoppingItem(
    ShoppingItem updatedItem,
    String shoppingListId,
  );

  Future<Either<Failure, List<ShoppingItem>>> getShoppingItemsById(
    String shoppingListId,
  );

  Future<Either<Failure, Unit>> deleteShoppingItem(
    ShoppingItem item,
    String shoppingListId,
  );
}
