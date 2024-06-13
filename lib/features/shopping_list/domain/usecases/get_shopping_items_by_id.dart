import 'package:fpdart/fpdart.dart';
import 'package:shoply/core/error/failure.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/interfaces/ishopping_item_repository.dart';

class GetShoppingItemsById implements UseCase<List<ShoppingItem>, String> {
  final IShoppingItemRepository shoppingItemRepository;

  GetShoppingItemsById(this.shoppingItemRepository);
  @override
  Future<Either<Failure, List<ShoppingItem>>> call(String params) async =>
      await shoppingItemRepository.getShoppingItemsById(params);
}
