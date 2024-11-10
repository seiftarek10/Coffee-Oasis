import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/Models/category_model.dart';
import 'package:coffee_oasis/Core/Models/coffee_drink_model.dart';
import 'package:coffee_oasis/Core/Models/coffee_drinks_hive_model.dart';
import 'package:coffee_oasis/Core/Models/fire_base_path_param.dart';
import 'package:coffee_oasis/Core/Models/user_model.dart';
import 'package:coffee_oasis/Core/NetWork/fire_store_services.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Features/User/Data/Models/order_model.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUserInfo();
  Future<List<CategoryEntity>> getAllCategories();
  Future<List<CoffeeEntity>> getCoffeeDrinks({required String id});
  Future<List<CoffeeEntity>> getAllCoffee();
  Future<void> addToCart({required OrderEntity cartItem});
  Future<List<OrderEntity>> getCartItems();
  Future<void> deleteCartItem({required String id});
  Future<void> makeOrder({required OrderEntity order});
  Future<void> deleteFromCartAfterOrder({required String id});
  Future<List<OrderEntity>> getMyOrders();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FireStoreServices _fireStoreServices;
  final UserLocalDataSource _userLocalDataSource;

  UserRemoteDataSourceImpl(this._fireStoreServices, this._userLocalDataSource);
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Future<UserEntity> getUserInfo() async {
    DocumentSnapshot<Map<String, dynamic>?> data =
        await _fireStoreServices.getDoc(endPoint: EndPoints.users, docId: uid);
    UserEntity user = UserModel.fromJson(data);
    return user;
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> data =
        await _fireStoreServices.getCollection(endPoint: EndPoints.categories);
    List<CategoryEntity> allCategoires = [];
    for (var category in data.docs) {
      allCategoires.add(CategoryModel.fromJson(category));
    }
    await _userLocalDataSource.saveCategories(allCategoires);
    return allCategoires;
  }

  @override
  Future<List<CoffeeEntity>> getCoffeeDrinks({String? id}) async {
    QuerySnapshot<Map<String, dynamic>> data =
        await _fireStoreServices.getSubCollection(
            fireBasePathParam: FireBasePathParam(
                parentCollection: EndPoints.categories,
                parentDocId: id!,
                subCollection: EndPoints.coffeeDrinks));
    List<CoffeeEntity> coffeeDrinks = [];
    for (var coffee in data.docs) {
      coffeeDrinks.add(CoffeeDrinkModel.fromjson(coffee));
    }
    await _userLocalDataSource.saveCoffeeDrink(
        coffeeDrinks:
            CoffeeDrinksHiveModel(id: id, coffeeDrinks: coffeeDrinks));

    return coffeeDrinks;
  }

  @override
  Future<List<CoffeeEntity>> getAllCoffee() async {
    QuerySnapshot<Map<String, dynamic>> allCategories =
        await _fireStoreServices.getCollection(endPoint: EndPoints.categories);
    List<CoffeeEntity> allCoffee = [];
    for (var cateogory in allCategories.docs) {
      QuerySnapshot<Map<String, dynamic>> categoryCoffeeDrinks =
          await _fireStoreServices.getSubCollection(
              fireBasePathParam: FireBasePathParam(
                  parentCollection: EndPoints.categories,
                  parentDocId: cateogory.id,
                  subCollection: EndPoints.coffeeDrinks));
      for (var coffee in categoryCoffeeDrinks.docs) {
        allCoffee.add(CoffeeDrinkModel.fromjson(coffee));
      }
    }
    await _userLocalDataSource.saveCoffeeDrink(
      coffeeDrinks:
          CoffeeDrinksHiveModel(id: 'allCoffee', coffeeDrinks: allCoffee),
    );
    return allCoffee;
  }

  @override
  Future<void> addToCart({required OrderEntity cartItem}) async {
    final coffeeeItem = await FirebaseFirestore.instance
        .collection(EndPoints.allCart)
        .doc(uid)
        .collection(EndPoints.userCart)
        .doc(cartItem.coffee.id)
        .get();

    if (coffeeeItem.exists) {
      await _fireStoreServices.updateDocFromSubCollection(
          fireBasePathParam: FireBasePathParam(
              parentCollection: EndPoints.allCart,
              parentDocId: uid,
              subCollection: EndPoints.userCart,
              subDocId: cartItem.coffee.id),
          body: {'counter': coffeeeItem['counter'] + 1});
    } else {
      await _fireStoreServices.postToSubCollectionWithId(
          fireBasePathParam: FireBasePathParam(
              parentCollection: EndPoints.allCart,
              parentDocId: uid,
              subCollection: EndPoints.userCart,
              subDocId: cartItem.coffee.id),
          body: cartItem.toCartJson());
    }
  }

  @override
  Future<List<OrderEntity>> getCartItems() async {
    QuerySnapshot<Map<String, dynamic>> response =
        await _fireStoreServices.getSubCollection(
            fireBasePathParam: FireBasePathParam(
                parentCollection: EndPoints.allCart,
                parentDocId: uid,
                subCollection: EndPoints.userCart));
    List<OrderEntity> cartItems = [];
    for (var item in response.docs) {
      cartItems.add(OrderModel.fromJson(item));
    }
    await _userLocalDataSource.saveCartItems(cartItems);
    return cartItems;
  }

  @override
  Future<void> deleteCartItem({required String id}) async {
    await _fireStoreServices.deleteDocFromSubCollection(
        fireBasePathParam: FireBasePathParam(
            parentCollection: EndPoints.allCart,
            parentDocId: uid,
            subCollection: EndPoints.userCart,
            subDocId: id));
  }

  @override
  Future<void> makeOrder({required OrderEntity order}) async {
    await _fireStoreServices.postToSubCollection(
        fireBasePathParam: FireBasePathParam(
            parentCollection: EndPoints.allOrders,
            parentDocId: uid,
            subCollection: EndPoints.userOrders),
        body: order.toOrderJson());
  }

  @override
  Future<void> deleteFromCartAfterOrder({required String id}) async {
    List<OrderEntity> cartItems = await getCartItems();
    bool exist = cartItems.any((cartItem) => cartItem.id == id);
    if (exist) {
      await deleteCartItem(id: id);
    } else {}
  }

  @override
  Future<List<OrderEntity>> getMyOrders() async {
    QuerySnapshot<Map<String, dynamic>> response =
        await _fireStoreServices.getSubCollection(
            fireBasePathParam: FireBasePathParam(
                parentCollection: EndPoints.allOrders,
                parentDocId: uid,
                subCollection: EndPoints.userOrders));
    List<OrderEntity> userOrders = [];
    for (var order in response.docs) {
      userOrders.add(OrderModel.fromJson(order));
    }
    return userOrders;
  }
}
