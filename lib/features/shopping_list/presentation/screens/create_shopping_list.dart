import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/core/common/dialogs/dailogs.dart';
import 'package:shoply/core/common/values/enums/item_unit.dart';
import 'package:shoply/core/common/widgets/loader.dart';
import 'package:shoply/core/theme/app_palette.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';
import 'package:shoply/features/shopping_list/presentation/cubits/shopping_list_cubit/shopping_list_cubit.dart';

class CreateShoppingListScreen extends StatefulWidget {
  const CreateShoppingListScreen({
    super.key,
    required this.onSuccess,
    this.shoppingList,
  });

  final ShoppingList? shoppingList;
  final void Function(int) onSuccess;

  @override
  State<CreateShoppingListScreen> createState() =>
      _CreateShoppingListScreenState();
}

class _CreateShoppingListScreenState extends State<CreateShoppingListScreen> {
  late final TextEditingController listNameController;

  final itemNameController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  Category? _selectedCategory;
  ItemUnit? _selectedUnit;

  @override
  void initState() {
    super.initState();
    listNameController =
        TextEditingController(text: widget.shoppingList?.name ?? '');
    context
        .read<ShoppingListCubit>()
        .setShoppingList(widget.shoppingList ?? ShoppingList.inital());
  }

  @override
  void dispose() {
    super.dispose();
    listNameController.dispose();
    itemNameController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ShoppingListCubit, ShoppingListState>(
          listener: (context, state) {
            if (state.isFailure) {
              Dialogs.showSnackBar(context, state.message!);
            }

            if (state.isSuccess) {
              _clearInputs();
            }

            if (state.isListSaved) {
              widget.onSuccess(0);
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Loader();
            }

            final currentItemNum =
                (state.shoppingList.shoppingItems.length + 1).toString();

            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Create New List',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 24,
                              ),
                        ),
                        IconButton(
                          iconSize: 24,
                          color: Theme.of(context).colorScheme.tertiary,
                          onPressed: () => widget.shoppingList == null
                              ? context
                                  .read<ShoppingListCubit>()
                                  .createShoppingList(
                                    name: listNameController.text.trim(),
                                    itemName: itemNameController.text.trim(),
                                    price: priceController.text.trim(),
                                    quantity: quantityController.text.trim(),
                                    category: _selectedCategory,
                                  )
                              : context
                                  .read<ShoppingListCubit>()
                                  .updateShoppingList(
                                    name: listNameController.text.trim(),
                                    itemName: itemNameController.text.trim(),
                                    price: priceController.text.trim(),
                                    quantity: quantityController.text.trim(),
                                    category: _selectedCategory,
                                  ),
                          icon: const Icon(FeatherIcons.check),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: listNameController,
                      decoration: InputDecoration(
                        hintText: 'Shopping List Name',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  fontSize: 16,
                                  color: AppPalette.blueGrey,
                                ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          color: AppPalette.cardBorderColor,
                        ),
                      ),
                      shadowColor: AppPalette.shadowColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppPalette.cardBorderColor,
                                    width: 1,
                                  ),
                                ),
                                child: Text(
                                  currentItemNum,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppPalette.textColor,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: itemNameController,
                                    decoration: InputDecoration(
                                      hintText: 'Item',
                                      hintStyle: Theme.of(context)
                                          .inputDecorationTheme
                                          .hintStyle
                                          ?.copyWith(
                                            fontSize: 14,
                                          ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: DropdownButtonFormField<ItemUnit>(
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    value: _selectedUnit,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedUnit = value;
                                      });
                                    },
                                    hint: Text(
                                      'Unit',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontSize: 14,
                                            color: AppPalette.blueGrey,
                                          ),
                                    ),
                                    items: ItemUnit.values
                                        .map<DropdownMenuItem<ItemUnit>>(
                                      (value) {
                                        return DropdownMenuItem<ItemUnit>(
                                          value: value,
                                          child: Text(value.name),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: quantityController,
                                    decoration: InputDecoration(
                                      hintText: 'Quantity',
                                      hintStyle: Theme.of(context)
                                          .inputDecorationTheme
                                          .hintStyle
                                          ?.copyWith(
                                            fontSize: 14,
                                          ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    controller: priceController,
                                    decoration: InputDecoration(
                                      hintText: 'Price per unit',
                                      hintStyle: Theme.of(context)
                                          .inputDecorationTheme
                                          .hintStyle
                                          ?.copyWith(
                                            fontSize: 14,
                                          ),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            DropdownButtonFormField<Category>(
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              value: _selectedCategory,
                              onChanged: (value) {
                                setState(() {
                                  _selectedCategory = value;
                                });
                              },
                              hint: Text(
                                'Category',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 14,
                                      color: AppPalette.blueGrey,
                                    ),
                              ),
                              items: Category.values
                                  .map<DropdownMenuItem<Category>>((value) {
                                return DropdownMenuItem<Category>(
                                  value: value,
                                  child: Text(value.value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () =>
                            context.read<ShoppingListCubit>().addNewItem(
                                  name: itemNameController.text.trim(),
                                  price: priceController.text.trim(),
                                  quantity: quantityController.text.trim(),
                                  unit: _selectedUnit,
                                  category: _selectedCategory,
                                ),
                        child: Text(
                          widget.shoppingList == null ? 'Add' : 'Update',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _clearInputs() {
    setState(() {
      itemNameController.text = '';
      priceController.text = '';
      quantityController.text = '';
      _selectedCategory = null;
      _selectedUnit = null;
    });
  }
}
