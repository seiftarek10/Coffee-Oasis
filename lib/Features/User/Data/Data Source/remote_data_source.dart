import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/Models/category_model.dart';
import 'package:coffee_oasis/Core/Models/coffee_drink_model.dart';
import 'package:coffee_oasis/Core/Models/coffee_drinks_hive_model.dart';
import 'package:coffee_oasis/Core/Models/fire_base_path_param.dart';
import 'package:coffee_oasis/Core/Models/order_model.dart';
import 'package:coffee_oasis/Core/Models/user_model.dart';
import 'package:coffee_oasis/Core/NetWork/fire_store_services.dart';
import 'package:coffee_oasis/Features/Owner/Data/Models/shop_info_model.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUserInfo();
  Future<List<CategoryEntity>> getAllCategories();
  Future<List<CoffeeEntity>> getCoffeeDrinks({required String id});
  Future<List<CoffeeEntity>> getAllCoffee();
  Future<void> addToCart({required OrderItemEntity cartItem});
  Future<List<OrderItemEntity>> getCartItems();
  Future<void> deleteCartItem({required String id});
  Future<void> makeOrder({required UserOrderEntity order});
  Future<void> deleteFromCartAfterOrder({required String id});
  Future<List<OrderItemEntity>> getMyOrders();
  Future<void> orderAll();
  Future<void> addFavoriteItem({required CoffeeEntity coffee});
  Future<bool> isFavoriteCoffee({required String id});
  Future<List<CoffeeEntity>> getFavoritesCoffee();
  Future<void> deleteFavoriteItem({required String id});
  Future<void> updateUserInfo({required Map<String, dynamic> body});
  Future<ShopInfoEntity> getShopInfo();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FireStoreServices _fireStoreServices;
  final UserLocalDataSource _userLocalDataSource;

  UserRemoteDataSourceImpl(this._fireStoreServices, this._userLocalDataSource);

  @override
  Future<UserEntity> getUserInfo() async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return UserEntity();
    }

    DocumentSnapshot<Map<String, dynamic>?> data =
        await _fireStoreServices.getDoc(endPoint: EndPoints.users, docId: uid);
    UserEntity user = UserModel.fromJson(data.data()!);
    await _userLocalDataSource.saveUserInfo(user: user);

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
  Future<void> addToCart({required OrderItemEntity cartItem}) async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return;
    }
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
          body: {
            'counter': coffeeeItem['counter'] + 1,
            'price': (coffeeeItem['counter'] * coffeeeItem['coffee']['price']) +
                coffeeeItem['coffee']['price']
          });
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
  Future<List<OrderItemEntity>> getCartItems() async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return [];
    }
    QuerySnapshot<Map<String, dynamic>> response =
        await _fireStoreServices.getSubCollection(
            fireBasePathParam: FireBasePathParam(
                parentCollection: EndPoints.allCart,
                parentDocId: uid,
                subCollection: EndPoints.userCart));
    List<OrderItemEntity> cartItems = [];
    for (var item in response.docs) {
      cartItems.add(OrderModel.fromJson(item.data(), item.id));
    }
    await _userLocalDataSource.saveCartItems(cartItems);
    return cartItems;
  }

  @override
  Future<void> deleteCartItem({required String id}) async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return;
    }
    await _fireStoreServices.deleteDocFromSubCollection(
        fireBasePathParam: FireBasePathParam(
            parentCollection: EndPoints.allCart,
            parentDocId: uid,
            subCollection: EndPoints.userCart,
            subDocId: id));
  }

  @override
  Future<void> makeOrder({required UserOrderEntity order}) async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return;
    }

    CollectionReference ordersRef =
        FirebaseFirestore.instance.collection(EndPoints.allOrders);
    DocumentReference orderRef = ordersRef.doc(uid);
    DocumentSnapshot snapshot = await orderRef.get();

    if (snapshot.exists) {
      final existingOrder = snapshot.data() as Map<String, dynamic>;
      List<OrderItemEntity> existingCoffee = (existingOrder['coffee'] as List)
          .map((item) => OrderModel.fromJson(
              item as Map<String, dynamic>, item['coffee']['id']))
          .toList();

      final newCoffeeItem = order.coffee![0];

      final existingIndex = existingCoffee
          .indexWhere((item) => item.coffee.id == newCoffeeItem.coffee.id);

      if (existingIndex != -1) {
        existingCoffee[existingIndex].counter += newCoffeeItem.counter;
        existingCoffee[existingIndex].price =
            (existingCoffee[existingIndex].price ?? 0) + newCoffeeItem.price!;

        await orderRef.update({
          'coffee': existingCoffee
              .map((item) => item.toOrderJson(date: DateTime.now().toString()))
              .toList(),
        });
      } else {
        await orderRef.update({
          'coffee': FieldValue.arrayUnion(
              [newCoffeeItem.toOrderJson(date: DateTime.now().toString())]),
        });
      }
    } else {
      await _fireStoreServices.postDocWithId(
        endPoint: EndPoints.allOrders,
        id: uid,
        body: order.toJson(),
      );
    }
  }

  @override
  Future<void> deleteFromCartAfterOrder({required String id}) async {
    List<OrderItemEntity> cartItems = await getCartItems();
    bool exist = cartItems.any((cartItem) => cartItem.id == id);
    if (exist) {
      await deleteCartItem(id: id);
    } else {}
  }

  @override
  Future<List<OrderItemEntity>> getMyOrders() async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return [];
    }
    DocumentSnapshot<Map<String, dynamic>?> response = await _fireStoreServices
        .getDoc(endPoint: EndPoints.allOrders, docId: uid);

    List<OrderItemEntity> userOrders = [];
    for (var order in response.data()!['coffee']) {
      userOrders.add(OrderModel.fromJson(order, order['coffee']['id']));
    }
    return userOrders;
  }

  @override
  Future<void> orderAll() async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return;
    }

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final cartRef = firestore
        .collection(EndPoints.allCart)
        .doc(uid)
        .collection(EndPoints.userCart);
    final orderRef = firestore.collection(EndPoints.allOrders).doc(uid);

    final cartItems = await cartRef.get();
    if (cartItems.docs.isEmpty) {
      return;
    }

    List<OrderItemEntity> newCoffeeItems = cartItems.docs
        .map((doc) => OrderModel.fromJson(doc.data(), doc.id))
        .toList();

    final existingOrderSnapshot = await orderRef.get();
    List<OrderItemEntity> existingCoffee = [];
    UserEntity? user;

    if (existingOrderSnapshot.exists) {
      final existingData = existingOrderSnapshot.data()!;
      existingCoffee = (existingData['coffee'] as List)
          .map((e) => OrderModel.fromJson(
              e as Map<String, dynamic>, existingOrderSnapshot.id))
          .toList();

      user = UserModel.fromJson(existingData['user']);
    } else {
      user = await _userLocalDataSource.getUserInfo();
      if (user == null) {
        return;
      }
    }

    for (var newItem in newCoffeeItems) {
      final existingIndex =
          existingCoffee.indexWhere((item) => item.coffee.id == newItem.id);
      if (existingIndex != -1) {
        existingCoffee[existingIndex].counter =
            (existingCoffee[existingIndex].counter) + (newItem.counter);
        existingCoffee[existingIndex].price =
            (existingCoffee[existingIndex].price ?? 0) + (newItem.price ?? 0);
      } else {
        existingCoffee.add(newItem);
      }
    }

    await orderRef.set({
      'coffee': existingCoffee
          .map((item) => item.toOrderJson(date: item.date ?? ''))
          .toList(),
      'user': user.toJson(),
    });

    final batch = firestore.batch();
    for (var cartItem in cartItems.docs) {
      batch.delete(cartItem.reference);
    }
    await batch.commit();
  }

  @override
  Future<void> addFavoriteItem({required CoffeeEntity coffee}) async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return;
    }
    await _fireStoreServices.postToSubCollectionWithId(
        fireBasePathParam: FireBasePathParam(
            parentCollection: EndPoints.favorites,
            parentDocId: uid,
            subCollection: EndPoints.userFavorites,
            subDocId: coffee.id),
        body: coffee.toJson());
    await getFavoritesCoffee();
  }

  @override
  Future<bool> isFavoriteCoffee({required String id}) async {
    List<CoffeeEntity> favCoffee = await getFavoritesCoffee();
    if (favCoffee.any((favCoffee) => favCoffee.id == id)) {
      return true;
    }
    return false;
  }

  @override
  Future<List<CoffeeEntity>> getFavoritesCoffee() async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return [];
    }
    QuerySnapshot<Map<String, dynamic>> favoritesCoffeeCollection =
        await _fireStoreServices.getSubCollection(
            fireBasePathParam: FireBasePathParam(
                parentCollection: EndPoints.favorites,
                parentDocId: uid,
                subCollection: EndPoints.userFavorites));
    List<CoffeeEntity> favoritesCoffee = [];
    for (var coffee in favoritesCoffeeCollection.docs) {
      favoritesCoffee.add(CoffeeEntity.fromJson(coffee.data()));
    }
    await _userLocalDataSource.saveFavoritesCoffee(
        favoritesCoffee: CoffeeDrinksHiveModel(
            id: 'FavoritesCoffee', coffeeDrinks: favoritesCoffee));
    return favoritesCoffee;
  }

  @override
  Future<void> deleteFavoriteItem({required String id}) async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return;
    }
    await _fireStoreServices.deleteDocFromSubCollection(
        fireBasePathParam: FireBasePathParam(
            parentCollection: EndPoints.favorites,
            parentDocId: uid,
            subCollection: EndPoints.userFavorites,
            subDocId: id));
    await getFavoritesCoffee();
  }

  @override
  Future<void> updateUserInfo({required Map<String, dynamic> body}) async {
    String? uid = await _userLocalDataSource.getUserID();

    if (uid == null) {
      return;
    }

    await _fireStoreServices.updateDoc(
        endPoint: EndPoints.users, body: body, docId: uid);
  }

  @override
  Future<ShopInfoEntity> getShopInfo() async {
    DocumentSnapshot<Map<String, dynamic>?> response = await _fireStoreServices
        .getDoc(endPoint: EndPoints.shopInfo, docId: '1');
    ShopInfoEntity shopInfo = ShopInfoModel.fromJson(response.data());
    await _userLocalDataSource.saveShopInfo(shopInfo: shopInfo);
    return (shopInfo);
  }
}
