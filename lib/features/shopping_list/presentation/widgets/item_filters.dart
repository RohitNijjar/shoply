import 'package:flutter/material.dart';
import 'package:shoply/core/common/values/enums/sorting_strategies.dart';
import 'package:shoply/core/common/widgets/app_check_box.dart';
import 'package:shoply/core/common/widgets/app_radio_button.dart';
import 'package:shoply/core/common/widgets/app_switch_toggle.dart';
import 'package:shoply/core/theme/app_palette.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/presentation/cubits/shopping_item_cubit/shopping_item_cubit.dart';

class ItemFilters extends StatefulWidget {
  const ItemFilters({
    super.key,
    required this.shoppingItems,
    required this.shoppingItemCubit,
  });

  final List<ShoppingItem> shoppingItems;
  final ShoppingItemCubit shoppingItemCubit;

  @override
  State<ItemFilters> createState() => _ItemFiltersState();
}

class _ItemFiltersState extends State<ItemFilters> {
  late bool _selectAllCategories;

  @override
  Widget build(BuildContext context) {
    final shoppingItemState = widget.shoppingItemCubit.state;
    _selectAllCategories = shoppingItemState.filters!.selectedCategories.entries
        .every((item) => item.value);
    final showSelectAll =
        shoppingItemState.filters!.selectedCategories.entries.length > 5;

    return SizedBox(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: AppPalette.errorColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.shoppingItemCubit.filterAndSort();
                  },
                  child: const Text('Apply'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 30),
                  if (showSelectAll)
                    AppCheckBox(
                      isChecked: _selectAllCategories,
                      onChanged: (newValue) {
                        setState(() {
                          shoppingItemState.filters!.selectedCategories
                              .updateAll(
                            (name, value) => value = newValue,
                          );
                        });
                      },
                      label: 'Select All',
                    ),
                  ...shoppingItemState.filters!.selectedCategories.entries
                      .map((item) {
                    return AppCheckBox(
                      isChecked: item.value,
                      onChanged: (newValue) {
                        setState(() {
                          shoppingItemState
                              .filters!.selectedCategories[item.key] = newValue;

                          if (showSelectAll) {
                            final allCategoriesSelected = shoppingItemState
                                .filters!.selectedCategories.values
                                .every((value) => value == true);

                            _selectAllCategories = allCategoriesSelected;
                          }
                        });
                      },
                      label: item.key.value,
                    );
                  }),
                  const SizedBox(height: 30),
                  Text(
                    'Sort By',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 20),
                  ...SortingStrategies.values.map(
                    (sortItem) => AppRadioButton<SortingStrategies>(
                      selected: shoppingItemState.filters!.selectedSort,
                      label: sortItem.value,
                      onChanged: (selectedSort) {
                        setState(() {
                          shoppingItemState.filters!.selectedSort =
                              selectedSort;
                        });
                      },
                      value: sortItem,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Status',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 20),
                  AppSwitchToggle(
                      isOn: shoppingItemState.filters!.hidePurchased,
                      label: 'Hide Purchased',
                      onChanged: (newValue) {
                        setState(() {
                          shoppingItemState.filters!.hidePurchased = newValue;
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
