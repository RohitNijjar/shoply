import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/interfaces/ishopping_item_repository.dart';

class UpdateShoppingItem implements UseCase<Unit, UpdateShoppingItemParams> {
  final IShoppingItemRepository shoppingItemRepository;

  UpdateShoppingItem(this.shoppingItemRepository);

  @override
  Future<Either<Failure, Unit>> call(UpdateShoppingItemParams params) async =>
      await shoppingItemRepository.updateShoppingItem(
        params.updatedItem,
        params.shoppingListId,
      );
}

class UpdateShoppingItemParams {
  final ShoppingItem updatedItem;
  final String shoppingListId;

  const UpdateShoppingItemParams({
    required this.updatedItem,
    required this.shoppingListId,
  });
}
