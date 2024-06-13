part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependicies() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  _initBase();
  _initAuth();
  _initShoppingList();
  _initShoppingItem();
}

void _initBase() {
  serviceLocator.registerLazySingleton(
    () => BaseCubit(),
  );
}

void _initAuth() {
  serviceLocator
    ..registerFactory<IAuthRemoteDataSource>(
      () => AuthRemoteDataSource(),
    )
    ..registerFactory<IAuthRepository>(
      () => AuthRepository(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => Login(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => Register(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => Logout(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AuthCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}

void _initShoppingList() {
  serviceLocator
    ..registerFactory<IShoppingListRemoteDataSource>(
      () => ShoppingListRemoteDataSource(),
    )
    ..registerFactory<IShoppingListRepository>(
      () => ShoppingListRepository(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CreateShoppingList(serviceLocator()),
    )
    ..registerFactory(
      () => GetShoppingLists(serviceLocator()),
    )
    ..registerFactory(
      () => UpdateShoppingList(serviceLocator()),
    )
    ..registerFactory(
      () => DeleteShoppingList(serviceLocator()),
    )
    ..registerLazySingleton(
      () => ShoppingListCubit(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}

void _initShoppingItem() {
  serviceLocator
    ..registerFactory<IShoppingItemRemoteDataSource>(
        () => ShoppingItemRemoteDataSource())
    ..registerFactory<IShoppingItemRepository>(
      () => ShoppingItemRepository(serviceLocator()),
    )
    ..registerFactory(() => UpdateShoppingItem(serviceLocator()))
    ..registerFactory(() => GetShoppingItemsById(serviceLocator()))
    ..registerFactory(() => DeleteShoppingItem(serviceLocator()))
    ..registerFactoryParam<ShoppingItemCubit, String, void>(
      (id, _) => ShoppingItemCubit(
        id,
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    );
}
