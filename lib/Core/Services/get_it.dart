import 'package:coffee_oasis/Core/Hive%20Data%20Base/boxes_name.dart';
import 'package:coffee_oasis/Core/Hive%20Data%20Base/hive_services.dart';
import 'package:coffee_oasis/Core/NetWork/fire_auth_services.dart';
import 'package:coffee_oasis/Core/NetWork/fire_store_services.dart';
import 'package:coffee_oasis/Core/NetWork/storage_services.dart';
import 'package:coffee_oasis/Features/Auth/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_all_categories.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);
  getIt.registerSingleton<StorageService>(
    StorageService(
      getIt.get<FirebaseStorage>(),
    ),
  );
  getIt.registerSingleton<FireStoreServices>(
    FireStoreServices(),
  );
  getIt.registerSingleton<OwnerLocalDataSourceImpl>(OwnerLocalDataSourceImpl(
      categoryHiveServices:
          HiveServices<CategoryEntity>(boxName: BoxesName.categoriesBox),
      coffeeHiveServices:
          HiveServices<CoffeeEntity>(boxName: BoxesName.coffeeBox)));
  getIt.registerSingleton<OwnerRemoteDataSourceImpl>(
    OwnerRemoteDataSourceImpl(
      getIt.get<FireStoreServices>(),
      getIt.get<StorageService>(),
      getIt.get<OwnerLocalDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<OwnerRepoImpl>(
    OwnerRepoImpl(
      getIt.get<OwnerRemoteDataSourceImpl>(),
      getIt.get<OwnerLocalDataSourceImpl>(),
    ),
  );
  getIt.registerSingleton<GetAllCategoriesUseCase>(
    GetAllCategoriesUseCase(
      getIt.get<OwnerRepoImpl>(),
    ),
  );

  getIt.registerSingleton<FireAuthServices>(
    FireAuthServices(),
  );
  getIt.registerSingleton<AuthRemoteDataSource>(
    AuthRemoteDataSource(
      getIt.get<FireAuthServices>(),
      getIt.get<FireStoreServices>(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      getIt.get<AuthRemoteDataSource>(),
    ),
  );
}
