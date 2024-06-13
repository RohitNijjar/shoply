import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoply/core/common/dialogs/dailogs.dart';
import 'package:shoply/core/common/widgets/empty_state.dart';
import 'package:shoply/core/common/widgets/loader.dart';
import 'package:shoply/core/theme/app_palette.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';
import 'package:shoply/features/shopping_list/presentation/cubits/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoply/features/shopping_list/presentation/widgets/item_card.dart';

class ShoppingListsScreen extends StatefulWidget {
  const ShoppingListsScreen({
    super.key,
    required this.onEdit,
  });

  final void Function(int, ShoppingList?) onEdit;

  @override
  State<ShoppingListsScreen> createState() => _ShoppingListsScreenState();
}

class _ShoppingListsScreenState extends State<ShoppingListsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ShoppingListCubit>().getShoppingLists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: BlocConsumer<ShoppingListCubit, ShoppingListState>(
              listener: (context, state) {
                if (state.isFailure) {
                  Dialogs.showSnackBar(context, state.message!);
                }
              },
              builder: (context, state) {
                Widget content = Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.shoppingLists.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.only(bottom: 25),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Dismissible(
                                key: ValueKey(state.shoppingLists[index].id),
                                background: Container(
                                  decoration: ShapeDecoration(
                                    color:
                                        AppPalette.errorColor.withOpacity(0.4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                    color:
                                        AppPalette.accentColor.withOpacity(0.4),
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
                                          Icons.edit,
                                          color: AppPalette.accentColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                dismissThresholds: const {
                                  DismissDirection.startToEnd: 0.25,
                                  DismissDirection.endToStart: 0.25,
                                },
                                confirmDismiss: (direction) async {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    return await Dialogs.showAlertDialog(
                                      context,
                                      'Delete List',
                                      'Are you sure you want to delete ${state.shoppingLists[index].name}',
                                    );
                                  }

                                  return true;
                                },
                                onDismissed: (direction) {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    context
                                        .read<ShoppingListCubit>()
                                        .deleteShoppingList(
                                            state.shoppingLists[index].id);
                                  } else if (direction ==
                                      DismissDirection.endToStart) {
                                    widget.onEdit(
                                        1, state.shoppingLists[index]);
                                  }
                                },
                                child: ItemCard(
                                  shoppingList: state.shoppingLists[index],
                                  shoppingListCubit:
                                      context.read<ShoppingListCubit>(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );

                if (state.isLoading) {
                  content = const Expanded(child: Loader());
                }

                if (state.listIsEmpty && !state.isLoading) {
                  content = const Expanded(
                      child: EmptyState(
                    message: 'No lists found',
                  ));
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Lists',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 24,
                              ),
                    ),
                    content,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
