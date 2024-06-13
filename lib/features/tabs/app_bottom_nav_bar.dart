import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shoply/core/common/dialogs/dailogs.dart';
import 'package:shoply/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';
import 'package:shoply/features/shopping_list/presentation/cubits/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoply/features/shopping_list/presentation/screens/create_shopping_list.dart';
import 'package:shoply/features/shopping_list/presentation/screens/shopping_lists.dart';
import 'package:shoply/init_dependencies.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({
    super.key,
  });

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  late List<Widget> screens;
  int _selectedIndex = 0;

  void selectIndex(int index, [ShoppingList? shoppingList]) {
    if (index != 1) {
      shoppingList = null;
      screens[1] = CreateShoppingListScreen(
        onSuccess: (index) => selectIndex(index),
        shoppingList: shoppingList,
      );
    }

    if (shoppingList != null) {
      screens[1] = CreateShoppingListScreen(
        onSuccess: (index) => selectIndex(index),
        shoppingList: shoppingList,
      );
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    screens = [
      ShoppingListsScreen(
        onEdit: (index, shoppingList) => selectIndex(index, shoppingList),
      ),
      CreateShoppingListScreen(
        onSuccess: (index) => selectIndex(index),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<ShoppingListCubit>(),
      child: Scaffold(
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 24,
          currentIndex: _selectedIndex,
          onTap: (index) async {
            if (index == 3) {
              Size size = MediaQuery.of(context).size;
              final position = RelativeRect.fromLTRB(
                size.width - 40,
                size.height - 115,
                40,
                115,
              );
              final List<PopupMenuEntry<String>> items = [
                PopupMenuItem(
                  onTap: () {
                    context.read<AuthCubit>().logoutUser();
                  },
                  child: const Text('Logout'),
                ),
              ];
              await Dialogs.showCustomMenu(
                context,
                position,
                items,
              );
              return;
            }
            if (index > 1) return;
            selectIndex(index);
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.plusCircle),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.bell),
              label: 'Notications',
            ),
            BottomNavigationBarItem(
              icon: Icon(FeatherIcons.moreVertical),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }
}
