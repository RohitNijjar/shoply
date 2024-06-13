import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/core/common/extensions/extensions.dart';
import 'package:shoply/core/theme/app_palette.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';
import 'package:shoply/features/shopping_list/presentation/cubits/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoply/features/shopping_list/presentation/screens/shopping_list.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.shoppingList,
    required this.shoppingListCubit,
  });

  final ShoppingList shoppingList;
  final ShoppingListCubit shoppingListCubit;

  @override
  Widget build(BuildContext context) {
    final numOfItems = shoppingList.shoppingItems.length;
    final numofItemsBought =
        shoppingList.shoppingItems.where((item) => item.isBought).length;

    return InkWell(
      radius: 10,
      onTap: () async {
        final reload = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ShoppingListScreen(
              shoppingList: shoppingList,
            ),
          ),
        );

        if (!context.mounted) return;

        if (reload) {
          context.read<ShoppingListCubit>().getShoppingLists();
        }
      },
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: AppPalette.cardBorderColor,
          ),
        ),
        shadowColor: AppPalette.shadowColor,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shoppingList.name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    '$numofItemsBought/$numOfItems',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shoppingList.createdAt!.mmmdyyyy(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  Text(
                    shoppingList.totalPrice,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
