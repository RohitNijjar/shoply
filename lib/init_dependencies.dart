import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shoply/core/common/cubit/base_cubit.dart';
import 'package:shoply/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:shoply/features/auth/data/repositories/auth_repository.dart';
import 'package:shoply/features/auth/domain/interfaces/iauth_repository.dart';
import 'package:shoply/features/auth/domain/usecases/login.dart';
import 'package:shoply/features/auth/domain/usecases/logout.dart';
import 'package:shoply/features/auth/domain/usecases/register.dart';
import 'package:shoply/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:shoply/features/shopping_list/data/datasources/shopping_item_remote_data_source.dart';
import 'package:shoply/features/shopping_list/data/datasources/shopping_list_remote_data_source.dart';
import 'package:shoply/features/shopping_list/data/repositories/shopping_item_repository.dart';
import 'package:shoply/features/shopping_list/data/repositories/shopping_list_repository.dart';
import 'package:shoply/features/shopping_list/domain/interfaces/ishopping_item_repository.dart';
import 'package:shoply/features/shopping_list/domain/interfaces/ishopping_list_repository.dart';
import 'package:shoply/features/shopping_list/domain/usecases/create_shopping_list.dart';
import 'package:shoply/features/shopping_list/domain/usecases/delete_shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/usecases/delete_shopping_list.dart';
import 'package:shoply/features/shopping_list/domain/usecases/get_shopping_items_by_id.dart';
import 'package:shoply/features/shopping_list/domain/usecases/get_shopping_lists.dart';
import 'package:shoply/features/shopping_list/domain/usecases/update_shopping_item.dart';
import 'package:shoply/features/shopping_list/domain/usecases/updated_shopping_list.dart';
import 'package:shoply/features/shopping_list/presentation/cubits/shopping_item_cubit/shopping_item_cubit.dart';
import 'package:shoply/features/shopping_list/presentation/cubits/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoply/firebase_options.dart';

part 'init_dependencies.main.dart';
