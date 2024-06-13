import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/exceptions.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/features/shopping_list/data/datasources/shopping_list_remote_data_source.dart';
import 'package:shoply/features/shopping_list/data/models/shopping_list_model.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';
import 'package:shoply/features/shopping_list/domain/interfaces/ishopping_list_repository.dart';

class ShoppingListRepository implements IShoppingListRepository {
  final IShoppingListRemoteDataSource shoppingListRemoteDataSource;

  ShoppingListRepository(this.shoppingListRemoteDataSource);

  @override
  Future<Either<Failure, Unit>> createShoppingList(
    ShoppingList shoppingList,
  ) async {
    try {
      await shoppingListRemoteDataSource.createShoppinglist(
        shoppingList: ShoppingListModel.fromDomain(shoppingList),
      );

      return right(unit);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, List<ShoppingList>>> getShoppingLists() async {
    try {
      final shoppingListModels =
          await shoppingListRemoteDataSource.getShoppingLists();

      List<ShoppingList> shoppingLists =
          shoppingListModels.map((item) => item.toDomain()).toList();

      return right(shoppingLists);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> updateShoppingList(
      ShoppingList updatedShoppingList) async {
    try {
      await shoppingListRemoteDataSource.updateShoppingList(
          ShoppingListModel.fromDomain(updatedShoppingList));

      return right(unit);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteShoppingList(
      String shoppingListId) async {
    try {
      await shoppingListRemoteDataSource.deleteShoppingList(shoppingListId);
      return right(unit);
    } on ServerException catch (e) {
      return left(
        Failure(e.message),
      );
    }
  }
}
