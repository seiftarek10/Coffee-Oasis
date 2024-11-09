import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Constant/value_constant.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/boxes_name.dart';
import 'package:coffee_oasis/Core/Models/coffee_drinks_hive_model.dart';
import 'package:coffee_oasis/Core/Services/bloc_observer.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/cart_item_entity.dart';
import 'package:coffee_oasis/coffee_oasis.dart';
import 'package:coffee_oasis/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupGetIt();
  // await checkAndMigrateHiveData();
  await setupHive();
  Bloc.observer = MyBlocObserver();
  runApp(const CoffeeOasis(flavor: Flavor.user));
}

Future<void> setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  Hive.registerAdapter(CategoryEntityAdapter());
  Hive.registerAdapter(CoffeeEntityAdapter());
  Hive.registerAdapter(CoffeeDrinksHiveModelAdapter());
  Hive.registerAdapter(CartItemEntityAdapter());
  await Hive.openBox<CoffeeDrinksHiveModel>(BoxesName.coffeeBox);
  await Hive.openBox<UserEntity>(BoxesName.userBox);
  await Hive.openBox<CategoryEntity>(BoxesName.categoriesBox);
  await Hive.openBox<CartItemEntity>(BoxesName.cartBox);
}

Future<void> checkAndMigrateHiveData() async {
  final prefs = await SharedPreferences.getInstance();
  final lastVersion = prefs.getInt('hiveSchemaVersion') ?? 0;

  if (lastVersion != AppConstant.hiveSchemaVersion) {
    await Hive.deleteBoxFromDisk(BoxesName.coffeeBox);
    await Hive.deleteBoxFromDisk(BoxesName.userBox);
    await Hive.deleteBoxFromDisk(BoxesName.categoriesBox);

    await prefs.setInt('hiveSchemaVersion', AppConstant.hiveSchemaVersion);
  }
}
