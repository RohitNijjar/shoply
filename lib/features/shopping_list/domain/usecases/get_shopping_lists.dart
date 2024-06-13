import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';
import 'package:shoply/features/shopping_list/domain/interfaces/ishopping_list_repository.dart';

class GetShoppingLists implements UseCase<List<ShoppingList>, NoParams> {
  final IShoppingListRepository shoppingListRepository;

  GetShoppingLists(this.shoppingListRepository);

  @override
  Future<Either<Failure, List<ShoppingList>>> call(NoParams params) async =>
      await shoppingListRepository.getShoppingLists();
}
