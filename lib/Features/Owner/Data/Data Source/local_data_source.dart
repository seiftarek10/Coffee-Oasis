import 'package:coffee_oasis/Core/Constant/boxes_name.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class OwnerLocalDataSource {
  Future<void> saveCategories({required List<CategoryEntity> categories});
  List<CategoryEntity> getCategories();
  Future<void> saveCoffeeDrinks({required List<CoffeeEntity> coffeeDrinks});
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
      {required List<CoffeeEntity> coffeeDrinks}) async {
    var box = Hive.box<CoffeeEntity>(BoxesName.coffeeBox);
    await box.addAll(coffeeDrinks);
  }

  @override
  List<CoffeeEntity> getCoffeeDrinks({required String id}) {
    var box = Hive.box<CoffeeEntity>(BoxesName.coffeeBox);
    List<CoffeeEntity> allCoffee = box.values.toList();
    if (allCoffee.isEmpty) {
      return [];
    }
    List<CoffeeEntity> selectedCoffee =
        allCoffee.where((coffee) => coffee.categoryId == id).toList();

    return selectedCoffee;
  }

  @override
  Future<void> clearCategoryBox() async {
    var box = Hive.box<CategoryEntity>(BoxesName.categoriesBox);
    await box.clear();
  }

  @override
  Future<void> clearCoffeeBox() async {
    var box = Hive.box<CoffeeEntity>(BoxesName.coffeeBox);
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
