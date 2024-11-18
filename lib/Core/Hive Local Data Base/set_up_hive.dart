import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/boxes_name.dart';
import 'package:coffee_oasis/Core/Models/coffee_drinks_hive_model.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveSetup {
  static Future<void> setupUserHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserEntityAdapter());
    Hive.registerAdapter(CategoryEntityAdapter());
    Hive.registerAdapter(CoffeeEntityAdapter());
    Hive.registerAdapter(CoffeeDrinksHiveModelAdapter());
    Hive.registerAdapter(OrderItemEntityAdapter());
    Hive.registerAdapter(ShopInfoEntityAdapter());

    if (!Hive.isBoxOpen(BoxesName.uidBox)) {
      await Hive.openBox<String>(BoxesName.uidBox);
    }
    if (!Hive.isBoxOpen(BoxesName.cartBox)) {
      await Hive.openBox<OrderItemEntity>(BoxesName.cartBox);
    }
    if (!Hive.isBoxOpen(BoxesName.userBox)) {
      await Hive.openBox<UserEntity>(BoxesName.userBox);
    }
    if (!Hive.isBoxOpen(BoxesName.coffeeBox)) {
      await Hive.openBox<CoffeeDrinksHiveModel>(BoxesName.coffeeBox);
    }
    if (!Hive.isBoxOpen(BoxesName.categoriesBox)) {
      await Hive.openBox<CategoryEntity>(BoxesName.categoriesBox);
    }
    if (!Hive.isBoxOpen(BoxesName.shopInfo)) {
      await Hive.openBox<ShopInfoEntity>(BoxesName.shopInfo);
    }
  }

  static Future<void> setupOwnerHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CategoryEntityAdapter());
    Hive.registerAdapter(CoffeeEntityAdapter());
    Hive.registerAdapter(CoffeeDrinksHiveModelAdapter());
    Hive.registerAdapter(ShopInfoEntityAdapter());

    if (!Hive.isBoxOpen(BoxesName.coffeeBox)) {
      await Hive.openBox<CoffeeDrinksHiveModel>(BoxesName.coffeeBox);
    }
    if (!Hive.isBoxOpen(BoxesName.categoriesBox)) {
      await Hive.openBox<CategoryEntity>(BoxesName.categoriesBox);
    }
    if (!Hive.isBoxOpen(BoxesName.shopInfo)) {
      await Hive.openBox<ShopInfoEntity>(BoxesName.shopInfo);
    }
  }
}
