import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/core/common/dialogs/dailogs.dart';
import 'package:shoply/core/common/extensions/extensions.dart';
import 'package:shoply/core/theme/app_palette.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/presentation/cubits/shopping_item_cubit/shopping_item_cubit.dart';

class ShoppingItemCard extends StatelessWidget {
  const ShoppingItemCard({
    super.key,
    required this.shoppingItem,
    required this.shoppingListId,
  });

  final ShoppingItem shoppingItem;
  final String shoppingListId;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(shoppingItem.id),
      background: Container(
        decoration: ShapeDecoration(
          color: AppPalette.errorColor.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.delete,
                color: AppPalette.errorColor,
              ),
            ],
          ),
        ),
      ),
      secondaryBackground: Container(
        decoration: ShapeDecoration(
          color: AppPalette.errorColor.withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete,
                color: AppPalette.errorColor,
              ),
            ],
          ),
        ),
      ),
      dismissThresholds: const {
        DismissDirection.startToEnd: 0.25,
        DismissDirection.endToStart: 0.25,
      },
      confirmDismiss: (direction) async => await Dialogs.showAlertDialog(
        context,
        'Delete Item',
        'Are you sure you want to delete ${shoppingItem.name}',
      ),
      onDismissed: (direction) {
        context.read<ShoppingItemCubit>().deleteItem(shoppingItem);
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppPalette.cardBorderColor),
        ),
        shadowColor: AppPalette.shadowColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${shoppingItem.name} | ${shoppingItem.quantity} ${shoppingItem.unit.name}s',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${shoppingItem.price.inMoneyFormat()}/${shoppingItem.unit.name}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
              Checkbox(
                value: shoppingItem.isBought,
                onChanged: (newValue) {
                  ShoppingItem updatedItem =
                      shoppingItem.copyWith(isBought: newValue ?? false);

                  context.read<ShoppingItemCubit>().updateItemStatus(
                        updatedItem,
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
