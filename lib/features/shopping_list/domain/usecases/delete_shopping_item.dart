import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/interfaces/ishopping_item_repository.dart';

class DeleteShoppingItem implements UseCase<Unit, DeleteShoppingItemParams> {
  final IShoppingItemRepository shoppingItemRepository;

  DeleteShoppingItem(this.shoppingItemRepository);

  @override
  Future<Either<Failure, Unit>> call(DeleteShoppingItemParams params) async =>
      await shoppingItemRepository.deleteShoppingItem(
        params.item,
        params.shoppingListId,
      );
}

class DeleteShoppingItemParams {
  final ShoppingItem item;
  final String shoppingListId;

  const DeleteShoppingItemParams({
    required this.item,
    required this.shoppingListId,
  });
}
