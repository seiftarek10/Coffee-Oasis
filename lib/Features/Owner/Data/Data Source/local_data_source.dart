import 'package:coffee_oasis/Core/Constant/boxes_name.dart';
import 'package:coffee_oasis/Features/Owner/Data/Models/coffee_drinks_hive_model.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class OwnerLocalDataSource {
  Future<void> saveCategories({required List<CategoryEntity> categories});
  List<CategoryEntity> getCategories();
  Future<void> saveCoffeeDrinks({required CoffeeDrinksHiveModel coffeeDrinks});
  List<CoffeeEntity> getCoffeeDrinks({required String id});
  Future<void> saveShopInfo({required ShopInfoEntity shopInfo});
  List<ShopInfoEntity> getShopInfo();
  Future<void> clearCategoryBox();
  Future<void> clearCoffeeBox();
  Future<void> clearShopInfoBox();
}

class OwnerLocalDataSourceImpl implements OwnerLocalDataSource {
  @override
  Future<void> saveCategories(
      {required List<CategoryEntity> categories}) async {
    var box = Hive.box<CategoryEntity>(BoxesName.categoriesBox);
    await box.addAll(categories);
  }

  @override
  List<CategoryEntity> getCategories() {
    var box = Hive.box<CategoryEntity>(BoxesName.categoriesBox);
    return box.values.toList();
  }

  @override
  Future<void> saveCoffeeDrinks(
      {required CoffeeDrinksHiveModel coffeeDrinks}) async {
    var box = Hive.box<CoffeeDrinksHiveModel>(BoxesName.coffeeBox);
    await box.put(coffeeDrinks.id, coffeeDrinks);
  }

  @override
  List<CoffeeEntity> getCoffeeDrinks({required String id}) {
    var box = Hive.box<CoffeeDrinksHiveModel>(BoxesName.coffeeBox);
    var coffeeDrinks = box.get(id);
    return coffeeDrinks?.coffeeDrinks??[];
  }

  @override
  Future<void> clearCategoryBox() async {
    var box = Hive.box<CategoryEntity>(BoxesName.categoriesBox);
    await box.clear();
  }

  @override
  Future<void> clearCoffeeBox() async {
    var box = Hive.box<CoffeeDrinksHiveModel>(BoxesName.coffeeBox);
    await box.clear();
  }

  @override
  Future<void> saveShopInfo({required ShopInfoEntity shopInfo}) async {
    var box = Hive.box<ShopInfoEntity>(BoxesName.shopInfoBox);
    await box.add(shopInfo);
  }

  @override
  List<ShopInfoEntity> getShopInfo() {
    var box = Hive.box<ShopInfoEntity>(BoxesName.shopInfoBox);

    return box.values.toList();
  }

  @override
  Future<void> clearShopInfoBox() async {
    var box = Hive.box<ShopInfoEntity>(BoxesName.shopInfoBox);
    await box.clear();
  }
}
