import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/boxes_name.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/hive_services.dart';
import 'package:coffee_oasis/Core/Models/coffee_drinks_hive_model.dart';
import 'package:coffee_oasis/Core/NetWork/fire_auth_services.dart';
import 'package:coffee_oasis/Core/NetWork/fire_store_services.dart';
import 'package:coffee_oasis/Core/NetWork/storage_services.dart';
import 'package:coffee_oasis/Features/Auth/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Features/Auth/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_all_categories.dart';
import 'package:coffee_oasis/Features/Staff/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Staff/Data/Repo/staff_repo_impl.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseStorage>(FirebaseStorage.instance);
  getIt.registerSingleton<StorageService>(StorageService());
  getIt.registerSingleton<FireStoreServices>(
    FireStoreServices(),
  );

  getIt.registerSingleton<OwnerLocalDataSourceImpl>(OwnerLocalDataSourceImpl(
      categoryHiveServices:
          HiveServices<CategoryEntity>(boxName: BoxesName.categoriesBox),
      coffeeDrinksHiveServices:
          HiveServices<CoffeeDrinksHiveModel>(boxName: BoxesName.coffeeBox),
      shopInfoHiveServices:
          HiveServices<ShopInfoEntity>(boxName: BoxesName.shopInfoBox)));
  getIt.registerSingleton<OwnerRepoImpl>(
    OwnerRepoImpl(
        OwnerRemoteDataSourceImpl(
          getIt.get<FireStoreServices>(),
          getIt.get<StorageService>(),
          getIt.get<OwnerLocalDataSourceImpl>(),
        ),
        getIt.get<OwnerLocalDataSourceImpl>()),
  );
  getIt.registerSingleton<GetAllCategoriesUseCase>(
    GetAllCategoriesUseCase(
      getIt.get<OwnerRepoImpl>(),
    ),
  );

  getIt.registerSingleton<FireAuthServices>(
    FireAuthServices(),
  );

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      AuthRemoteDataSourceImpl(
        getIt.get<FireAuthServices>(),
        getIt.get<FireStoreServices>(),
      ),
      AuthLoaclaDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<UserLocalDataSourceImpl>(UserLocalDataSourceImpl(
    categoryBox: HiveServices<CategoryEntity>(boxName: BoxesName.categoriesBox),
    userBox: HiveServices<UserEntity>(boxName: BoxesName.userBox),
    coffeeDrinksBox:
        HiveServices<CoffeeDrinksHiveModel>(boxName: BoxesName.coffeeBox),
    cartBox: HiveServices<OrderItemEntity>(boxName: BoxesName.cartBox),
    shopInfoBox: HiveServices<ShopInfoEntity>(boxName: BoxesName.shopInfoBox),
  ));

  getIt.registerSingleton<UserRepoImpl>(UserRepoImpl(
      userRemoteDataSource: UserRemoteDataSourceImpl(
          getIt.get<FireStoreServices>(), getIt.get<UserLocalDataSourceImpl>()),
      userLocalDataSource: getIt.get<UserLocalDataSourceImpl>()));
  getIt.registerSingleton<StaffRepoImpl>(StaffRepoImpl(
      staffRemoteDataSource: StaffRemoteDataSourceImpl(
          fireStoreServices: getIt.get<FireStoreServices>())));
}
