import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoply/core/common/values/enums/item_unit.dart';
import 'package:shoply/features/shopping_list/domain/usecases/delete_shopping_list.dart';
import 'package:shoply/features/shopping_list/domain/usecases/updated_shopping_list.dart';
import 'package:uuid/uuid.dart';

import 'package:shoply/core/common/extensions/extensions.dart';
import 'package:shoply/core/common/validators/validator.dart';
import 'package:shoply/core/common/values/constants/error.dart';
import 'package:shoply/core/common/values/enums/category.dart';
import 'package:shoply/core/usecase/usecase.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/entities/shopping_list.dart';
import 'package:shoply/features/shopping_list/domain/usecases/create_shopping_list.dart';
import 'package:shoply/features/shopping_list/domain/usecases/get_shopping_lists.dart';

part 'shopping_list_cubit.freezed.dart';
part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  ShoppingListCubit(
    this.createShoppingListUseCase,
    this.getShoppingListsUseCase,
    this.updateShoppingListUseCase,
    this.deleteShoppingListUseCase,
  ) : super(ShoppingListState.initial());

  final uuid = const Uuid();
  final CreateShoppingList createShoppingListUseCase;
  final GetShoppingLists getShoppingListsUseCase;
  final UpdateShoppingList updateShoppingListUseCase;
  final DeleteShoppingList deleteShoppingListUseCase;

  Future<void> getShoppingLists() async {
    emit(state.copyWith(isLoading: true));

    final response = await getShoppingListsUseCase(NoParams());

    response.fold(
      (failure) => emit(
        state.copyWith(
            isLoading: false, isFailure: true, message: failure.message),
      ),
      (lists) => emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          listIsEmpty: lists.isEmpty,
          shoppingLists: lists,
        ),
      ),
    );

    _resetFlags();
  }

  void addNewItem({
    required String name,
    required String price,
    required String quantity,
    required ItemUnit? unit,
    required Category? category,
  }) {
    final validationError = _validateShoppingItem(
      name,
      price,
      quantity,
      unit,
      category,
    );

    if (validationError.isNotEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          message: validationError,
        ),
      );
    }

    if (!state.isFailure) {
      ShoppingItem newShoppingItem = ShoppingItem(
        id: uuid.v4(),
        name: name,
        price: double.parse(price),
        quantity: num.parse(quantity),
        unit: unit!,
        category: category!,
        isBought: false,
      );

      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          shoppingList: state.shoppingList.copyWith(
            shoppingItems: [
              newShoppingItem,
              ...state.shoppingList.shoppingItems
            ],
          ),
        ),
      );
    }

    _resetFlags();
  }

  Future<void> createShoppingList({
    required String name,
    required String itemName,
    required String price,
    required String quantity,
    required Category? category,
  }) async {
    emit(state.copyWith(isLoading: true));

    final validationError = _validateShoppingList(name);

    if (validationError.isNotEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          message: validationError,
        ),
      );
    }

    if (!state.isFailure) {
      ShoppingList newShoppingList = state.shoppingList.copyWith(
        id: uuid.v4(),
        name: name,
        createdAt: DateTime.now().toUtc(),
      );

      final response = await createShoppingListUseCase(newShoppingList);

      response.fold(
        (failure) => emit(
          state.copyWith(
              isLoading: false, isFailure: true, message: failure.message),
        ),
        (shoppingItem) => emit(
          state.copyWith(
            isLoading: false,
            isListSaved: true,
          ),
        ),
      );
    }

    _resetFlags();
  }

  Future<void> updateShoppingList({
    required String name,
    required String itemName,
    required String price,
    required String quantity,
    required Category? category,
  }) async {
    emit(state.copyWith(isLoading: true));

    final validationError = _validateShoppingList(name);

    if (validationError.isNotEmpty) {
      emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          message: validationError,
        ),
      );
    }

    if (!state.isFailure) {
      ShoppingList updatedShoppingList = state.shoppingList.copyWith(
        id: state.shoppingList.id,
        name: name,
        createdAt: DateTime.now().toUtc(),
      );

      final response = await updateShoppingListUseCase(updatedShoppingList);

      response.fold(
        (failure) => emit(
          state.copyWith(
            isLoading: false,
            isFailure: true,
            message: failure.message,
          ),
        ),
        (shoppingItem) => emit(
          state.copyWith(
            isLoading: false,
            isListSaved: true,
          ),
        ),
      );
    }

    _resetFlags();
  }

  Future<void> deleteShoppingList(String shoppingListId) async {
    final updatedShoppingLists = state.shoppingLists
        .filter((shoppingList) => shoppingList.id != shoppingListId)
        .toList();
    final response = await deleteShoppingListUseCase(shoppingListId);

    response.fold(
      (failure) => emit(
        state.copyWith(
          isLoading: false,
          isFailure: true,
          message: failure.message,
        ),
      ),
      (_) => emit(
        state.copyWith(
          shoppingLists: updatedShoppingLists,
          listIsEmpty: updatedShoppingLists.isEmpty,
        ),
      ),
    );

    _resetFlags();
  }

  void setShoppingList(ShoppingList shoppingList) {
    emit(state.copyWith(shoppingList: shoppingList));
  }

  String _validateShoppingList(String name) {
    String error = '';
    if (name.isEmpty) {
      error = Error.invalidName;
    } else if (state.shoppingList.shoppingItems.isEmpty) {
      error = Error.invalidShoppingList;
    }

    return error;
  }

  String _validateShoppingItem(
    String name,
    String price,
    String quantity,
    ItemUnit? unit,
    Category? category,
  ) {
    String error = '';
    final validateName = Validator.isFieldValid(name, 'Name');
    final validatePrice = Validator.isFieldValid(price, 'Price');
    final validateQuantity = Validator.isFieldValid(quantity, 'Quantity');

    if (validateName.isLeft()) {
      error = validateName.asLeft().message;
    } else if (unit == null) {
      error = 'Unit is Required';
    } else if (validateQuantity.isLeft()) {
      error = validateQuantity.asLeft().message;
    } else if (validatePrice.isLeft()) {
      error = validatePrice.asLeft().message;
    } else if (category == null) {
      error = 'Category is Required';
    }

    return error;
  }

  void updateShoppingItemState(ShoppingItem updatedItem) {
    List<ShoppingList> shoppingLists = List.from(state.shoppingLists);
    ShoppingList shoppingList = shoppingLists
        .where((list) =>
            list.shoppingItems.any((item) => item.id == updatedItem.id))
        .first;

    final updatedShoppingItems = shoppingList.shoppingItems
        .map((item) => item.id == updatedItem.id ? updatedItem : item)
        .toList();

    final updatedShoppingList =
        shoppingList.copyWith(shoppingItems: updatedShoppingItems);

    final updatedShoppingLists = state.shoppingLists
        .map((list) => list == shoppingList ? updatedShoppingList : list)
        .toList();

    emit(state.copyWith(shoppingLists: updatedShoppingLists));
  }

  void _resetFlags() {
    emit(
      state.copyWith(
        isFailure: false,
        isLoading: false,
        isSuccess: false,
        isListSaved: false,
        message: null,
      ),
    );
  }
}
