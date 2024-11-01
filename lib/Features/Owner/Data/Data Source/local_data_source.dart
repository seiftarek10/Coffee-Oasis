import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/hive_services.dart';
import 'package:coffee_oasis/Core/Models/coffee_drinks_hive_model.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';

abstract class OwnerLocalDataSource {
  Future<void> saveCategories({required List<CategoryEntity> categories});
  List<CategoryEntity> getCategories();
  Future<void> saveCoffeeDrinks({required CoffeeDrinksHiveModel coffeeDrinks});
  List<CoffeeEntity> getCoffeeDrinks({required String id});
  Future<void> saveShopInfo({required ShopInfoEntity shopInfo});
  ShopInfoEntity? getShopInfo();
}

class OwnerLocalDataSourceImpl implements OwnerLocalDataSource {
  final HiveServices<CategoryEntity> categoryHiveServices;
  final HiveServices<CoffeeDrinksHiveModel> coffeeDrinksHiveServices;
  final HiveServices<ShopInfoEntity> shopInfoHiveServices;

  OwnerLocalDataSourceImpl(
      {required this.categoryHiveServices,
      required this.coffeeDrinksHiveServices,
      required this.shopInfoHiveServices});

  @override
  Future<void> saveCategories(
      {required List<CategoryEntity> categories}) async {
    await categoryHiveServices.saveData(categories);
  }

  @override
  List<CategoryEntity> getCategories() {
    return categoryHiveServices.getData();
  }

  @override
  Future<void> saveCoffeeDrinks(
      {required CoffeeDrinksHiveModel coffeeDrinks}) async {
    await coffeeDrinksHiveServices.saveWithKey(
        object: coffeeDrinks, objectKey: coffeeDrinks.id);
  }

  @override
  List<CoffeeEntity> getCoffeeDrinks({required String id}) {
    CoffeeDrinksHiveModel? allCoffeeDrinks =
        coffeeDrinksHiveServices.getByKey(objectKey: id);
    List<CoffeeEntity> selectedCoffee = [];
    if (allCoffeeDrinks != null) {
      for (var coffee in allCoffeeDrinks.coffeeDrinks) {
        if (coffee.id != null) {
          selectedCoffee.add(coffee);
        }
      }
      return selectedCoffee;
    }
    return [];
  }

  @override
  Future<void> saveShopInfo({required ShopInfoEntity shopInfo}) async {
    await shopInfoHiveServices.saveWithKey(object: shopInfo, objectKey: 'shop');
  }

  @override
  ShopInfoEntity? getShopInfo() {
    return shopInfoHiveServices.getByKey(objectKey: 'shop');
  }
}
