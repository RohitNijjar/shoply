import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';
import 'package:shoply/features/shopping_list/domain/interfaces/ishopping_list_repository.dart';

class UpdateShoppingList implements UseCase<Unit, ShoppingList> {
  final IShoppingListRepository shoppingListRepository;

  UpdateShoppingList(this.shoppingListRepository);

  @override
  Future<Either<Failure, Unit>> call(ShoppingList params) async =>
      await shoppingListRepository.updateShoppingList(params);
}
