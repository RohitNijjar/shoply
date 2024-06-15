// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shoply/core/common/dialogs/dailogs.dart';
import 'package:shoply/core/common/extensions/extensions.dart';
import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/core/common/widgets/input_field.dart';
import 'package:shoply/core/common/widgets/loader.dart';
import 'package:shoply/core/theme/app_palette.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';
import 'package:shoply/features/shopping_list/presentation/cubits/shopping_item_cubit/shopping_item_cubit.dart';
import 'package:shoply/features/shopping_list/presentation/widgets/item_filters.dart';
import 'package:shoply/features/shopping_list/presentation/widgets/shopping_item_card.dart';
import 'package:shoply/init_dependencies.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({
    super.key,
    required this.shoppingList,
  });

  final ShoppingList shoppingList;

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final TextEditingController searchController = TextEditingController();

  void _showItemFilters(ShoppingItemCubit cubit) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (context) => ItemFilters(
        shoppingItems: widget.shoppingList.shoppingItems,
        shoppingItemCubit: cubit,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<ShoppingItemCubit>(
        param1: widget.shoppingList.id,
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                true,
              );
            },
            icon: Icon(
              FeatherIcons.arrowLeft,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 30.0,
            ),
          ),
          title: Text(
            widget.shoppingList.name,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 24,
                ),
          ),
          titleSpacing: 0,
        ),
        body: BlocConsumer<ShoppingItemCubit, ShoppingItemState>(
          listener: (context, state) {
            if (state.isFailure) {
              Dialogs.showSnackBar(context, state.message!);
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Loader();
            }

            final shoppingItemsUi = state.shoppingItemsUi;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          controller: searchController,
                          hintText: 'Search',
                          prefixIcon: FeatherIcons.search,
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton.outlined(
                        onPressed: () {
                          _showItemFilters(context.read<ShoppingItemCubit>());
                        },
                        icon: const Icon(FeatherIcons.sliders),
                        style: IconButton.styleFrom(
                          minimumSize: const Size(48, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(
                            color: AppPalette.grey2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: shoppingItemsUi.length,
                      itemBuilder: (context, index) {
                        Category category = shoppingItemsUi[index].category;

                        List<ShoppingItem> items =
                            shoppingItemsUi[index].shoppingItems;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${category.value} | ${shoppingItemsUi[index].totalPrice.inMoneyFormat()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppPalette.grey3,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: items.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: ShoppingItemCard(
                                  shoppingItem: items[index],
                                  shoppingListId: widget.shoppingList.id,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
