import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/boxes_name.dart';
import 'package:coffee_oasis/Core/Constant/value_constant.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/hive_services.dart';
import 'package:coffee_oasis/Core/Models/coffee_drinks_hive_model.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class UserLocalDataSource {
  Future<UserEntity?> getUserInfo();
  Future<void> saveCategories(List<CategoryEntity> categories);
  List<CategoryEntity> getAllCategories();
  Future<void> saveCoffeeDrink({required CoffeeDrinksHiveModel coffeeDrinks});
  List<CoffeeEntity> getAllCoffee();
  List<CoffeeEntity> getCoffeeDrinks({required String id});
  Future<void> saveCartItems(List<OrderEntity> cartItems);
  List<OrderEntity> getCartItems();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final HiveServices<UserEntity> userBox;
  final HiveServices<CategoryEntity> categoryBox;
  final HiveServices<CoffeeDrinksHiveModel> coffeeDrinksBox;
  final HiveServices<OrderEntity> cartBox;

  UserLocalDataSourceImpl(
      {required this.userBox,
      required this.categoryBox,
      required this.coffeeDrinksBox,
      required this.cartBox});
  Future<String?> getUserID() async {
    Box<String> box = await Hive.openBox<String>(BoxesName.uidBox);
    return box.get(AppConstant.uid);
  }

  @override
  Future<UserEntity?> getUserInfo() async {
    String? uid = await getUserID();

    UserEntity? user = userBox.getByKey(objectKey: uid);
    return user;
  }

  @override
  Future<void> saveCategories(List<CategoryEntity> categories) async {
    await categoryBox.saveData(categories);
  }

  @override
  List<CategoryEntity> getAllCategories() {
    return categoryBox.getData();
  }

  @override
  Future<void> saveCoffeeDrink(
      {required CoffeeDrinksHiveModel coffeeDrinks}) async {
    await coffeeDrinksBox.saveWithKey(
        object: coffeeDrinks, objectKey: coffeeDrinks.id);
  }

  @override
  List<CoffeeEntity> getCoffeeDrinks({required String id}) {
    CoffeeDrinksHiveModel? category = coffeeDrinksBox.getByKey(objectKey: id);

    if (category == null) {
      return [];
    }
    return category.coffeeDrinks;
  }

  @override
  List<CoffeeEntity> getAllCoffee() {
    CoffeeDrinksHiveModel? categoryCoffee =
        coffeeDrinksBox.getByKey(objectKey: 'allCoffee');
    List<CoffeeEntity> allCoffee = [];
    for (var coffee in categoryCoffee?.coffeeDrinks ?? []) {
      allCoffee.add(coffee);
    }

    return allCoffee;
  }

  @override
  Future<void> saveCartItems(List<OrderEntity> cartItems) async {
    await cartBox.saveData(cartItems);
  }

  @override
  List<OrderEntity> getCartItems() {
    return cartBox.getData();
  }
}
