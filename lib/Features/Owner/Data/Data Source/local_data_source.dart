import 'package:coffee_oasis/Core/Hive%20Data%20Base/boxes_name.dart';
import 'package:coffee_oasis/Core/Hive%20Data%20Base/hive_services.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class OwnerLocalDataSource {
  Future<void> saveCategories({required List<CategoryEntity> categories});
  Future<List<CategoryEntity>> getCategories();

  Future<void> saveCoffeeDrinks(
      {required String categoryKey, required List<CoffeeEntity> coffeeDrinks});
  Future<List<CoffeeEntity>> getCoffeeDrinks({required String dataKey});
  Future<void> deleteCoffee({required int index});
  Future<void> clearCategoryBox();
  Future<void> clearCoffeeBox();
}

class OwnerLocalDataSourceImpl implements OwnerLocalDataSource {
  final HiveServices<CategoryEntity> _categoryHiveServices;
  final HiveServices<CoffeeEntity> _coffeeHiveServices;

  OwnerLocalDataSourceImpl(
      {required HiveServices<CategoryEntity> categoryHiveServices,
      required HiveServices<CoffeeEntity> coffeeHiveServices})
      : _categoryHiveServices = categoryHiveServices,
        _coffeeHiveServices = coffeeHiveServices;

  @override
  Future<void> saveCategories(
      {required List<CategoryEntity> categories}) async {
    await _categoryHiveServices.saveData(categories);
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    return await _categoryHiveServices.getData();
  }



  @override
  Future<void> saveCoffeeDrinks(
      {required String categoryKey,
      required List<CoffeeEntity> coffeeDrinks}) async {
    await _coffeeHiveServices.saveListWithKey(
        categoryKey: categoryKey, coffee: coffeeDrinks);
  }

  @override
  Future<List<CoffeeEntity>> getCoffeeDrinks({required String dataKey}) async {
    return await _coffeeHiveServices.getByKey(dataKey: dataKey) ?? [];
  }

  @override
  Future<void> deleteCoffee({required int index}) async {
    await Hive.box(BoxesName.coffeeBox).deleteAt(index);
  }

  @override
  Future<void> clearCategoryBox() async {
    await _categoryHiveServices.clear();
  }

  @override
  Future<void> clearCoffeeBox() async {
    await _categoryHiveServices.clear();
  }
}
