import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';

abstract interface class IShoppingListRepository {
  Future<Either<Failure, Unit>> createShoppingList(
    ShoppingList shoppingList,
  );

  Future<Either<Failure, List<ShoppingList>>> getShoppingLists();

  Future<Either<Failure, Unit>> updateShoppingList(
    ShoppingList updatedShoppingList,
  );

  Future<Either<Failure, Unit>> deleteShoppingList(String shoppingListId);
}
