import 'package:coffee_oasis/Core/Constant/boxes_name.dart';
import 'package:coffee_oasis/Core/Services/bloc_observer.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/Owner/Data/Models/coffee_drinks_hive_model.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';

import 'package:coffee_oasis/coffee_oasis.dart';
import 'package:coffee_oasis/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryEntityAdapter());
  Hive.registerAdapter(CoffeeEntityAdapter());
  Hive.registerAdapter(CoffeeDrinksHiveModelAdapter());
  Hive.registerAdapter(ShopInfoEntityAdapter());
  await Hive.openBox<CategoryEntity>(BoxesName.categoriesBox);
  await Hive.openBox<CoffeeDrinksHiveModel>(BoxesName.coffeeBox);
  await Hive.openBox<ShopInfoEntity>(BoxesName.shopInfoBox);
  runApp(const CoffeeOasis(flavor: Flavor.owner));
  Bloc.observer = MyBlocObserver();
}
