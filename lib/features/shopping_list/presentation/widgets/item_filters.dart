import 'package:flutter/material.dart';
import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/core/common/values/enums/sort_by_categories.dart';
import 'package:shoply/core/common/widgets/app_check_box.dart';
import 'package:shoply/core/common/widgets/app_radio_button.dart';
import 'package:shoply/core/common/widgets/app_switch_toggle.dart';
import 'package:shoply/core/theme/app_palette.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';

class ItemFilters extends StatefulWidget {
  const ItemFilters({
    super.key,
    required this.shoppingItems,
  });

  final List<ShoppingItem> shoppingItems;

  @override
  State<ItemFilters> createState() => _ItemFiltersState();
}

class _ItemFiltersState extends State<ItemFilters> {
  bool _selectAllCategories = true;
  bool _hidePurchased = false;
  var _selectedSorting = SortByCategories.categoryNameAsc;
  late Map<Category, bool> categories = <Category, bool>{
    for (var value in widget.shoppingItems) value.category: true
  };

  void _selectSorting(SortByCategories sort) {
    setState(() {
      _selectedSorting = sort;
    });
  }

  @override
  Widget build(BuildContext context) {
    final showSelectAll = categories.entries.length > 5;

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
                  onPressed: () {},
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
                          _selectAllCategories = newValue;
                          categories.updateAll(
                              (name, value) => value = _selectAllCategories);
                        });
                      },
                      label: 'Select All',
                    ),
                  ...categories.entries.map((item) {
                    return AppCheckBox(
                      isChecked: item.value,
                      onChanged: (newValue) {
                        categories[item.key] = newValue;
                        setState(() {
                          categories[item.key] = newValue;

                          if (showSelectAll) {
                            final allCategoriesSelected = categories.values
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
                  ...SortByCategories.values.map(
                    (sortItem) => AppRadioButton<SortByCategories>(
                      selected: _selectedSorting,
                      label: sortItem.value,
                      onChanged: (selectedSort) {
                        _selectSorting(selectedSort);
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
                      isOn: _hidePurchased,
                      label: 'Hide Purchased',
                      onChanged: (newValue) {
                        setState(() {
                          _hidePurchased = newValue;
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
