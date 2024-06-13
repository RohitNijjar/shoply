import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/shopping_list/domain/interfaces/ishopping_list_repository.dart';

class DeleteShoppingList implements UseCase<Unit, String> {
  final IShoppingListRepository shoppingListRepository;

  DeleteShoppingList(this.shoppingListRepository);

  @override
  Future<Either<Failure, Unit>> call(String params) async =>
      await shoppingListRepository.deleteShoppingList(params);
}
