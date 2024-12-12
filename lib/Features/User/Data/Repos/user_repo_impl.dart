import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent_input_model.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  UserRepoImpl(
      {required UserRemoteDataSource userRemoteDataSource,
      required UserLocalDataSource userLocalDataSource})
      : _userRemoteDataSource = userRemoteDataSource,
        _userLocalDataSource = userLocalDataSource;

  @override
  Future<Either<Failure, UserEntity>> getUserInfo(
      {required bool remoteSource}) async {
    try {
      UserEntity? user = await _userLocalDataSource.getUserInfo();
      if (!remoteSource && user != null) {
        return right(user);
      }
      user = await _userRemoteDataSource.getUserInfo();
      return right(user);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      List<CategoryEntity>? categories = [];
      categories = _userLocalDataSource.getAllCategories();

      if (categories.isEmpty) {
        categories = await _userRemoteDataSource.getAllCategories();
        await _userLocalDataSource.saveCategories(categories);
      }

      FirebaseFirestore.instance
          .collection(EndPoints.categories)
          .snapshots()
          .listen((snapshot) async {
        if (snapshot.docChanges.any((change) =>
            change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified ||
            change.type == DocumentChangeType.removed)) {
          categories = await _userRemoteDataSource.getAllCategories();
        }
      });

      return right(categories ?? []);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CoffeeEntity>>> getCoffeeDrinks(
      {String? id}) async {
    try {
      List<CoffeeEntity> coffeeDrinks;

      if (id == null) {
        coffeeDrinks = _userLocalDataSource.getAllCoffee();
        if (coffeeDrinks.isEmpty) {
          coffeeDrinks = await _userRemoteDataSource.getAllCoffee();
        }
      } else {
        coffeeDrinks = _userLocalDataSource.getCoffeeDrinks(id: id);
        if (coffeeDrinks.isEmpty) {
          coffeeDrinks = await _userRemoteDataSource.getCoffeeDrinks(id: id);
        }
      }
      FirebaseFirestore.instance
          .collection(EndPoints.coffeeDrinks)
          .snapshots()
          .listen((snapshot) async {
        if (snapshot.docChanges.any((change) =>
            change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified ||
            change.type == DocumentChangeType.removed)) {
          if (id == null) {
            coffeeDrinks = await _userRemoteDataSource.getAllCoffee();
          } else {
            coffeeDrinks = await _userRemoteDataSource.getCoffeeDrinks(id: id);
          }
        }
      });

      return right(coffeeDrinks);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addToCart(
      {required OrderItemEntity coffeeItem}) async {
    try {
      await _userRemoteDataSource.addToCart(cartItem: coffeeItem);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderItemEntity>>> getCartItems() async {
    try {
      String? uid = await _userLocalDataSource.getUserID();
      if (uid == null) {
        return right([]);
      }
      List<OrderItemEntity> cartItem = [];
      cartItem = _userLocalDataSource.getCartItems();
      if (cartItem.isEmpty) {
        cartItem = await _userRemoteDataSource.getCartItems();
      }
      FirebaseFirestore.instance
          .collection(EndPoints.allCart)
          .doc(uid)
          .collection(EndPoints.userCart)
          .snapshots()
          .listen((snapshot) async {
        if (snapshot.docChanges.any((change) =>
            change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified ||
            change.type == DocumentChangeType.removed)) {
          cartItem = await _userRemoteDataSource.getCartItems();
        }
      });
      return right(cartItem);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCartItem({required String id}) async {
    try {
      await _userRemoteDataSource.deleteCartItem(id: id);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> makeOrder(
      {required UserOrderEntity order,
      required String id,
      required bool isDelivery,
      required bool fromCart}) async {
    try {
      await _userRemoteDataSource.makeOrder(
          order: order, isDelivery: isDelivery);
      if (fromCart) {
        await _userRemoteDataSource.deleteFromCartAfterOrder(id: id);
      }
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderItemEntity>>> getMyOrders() async {
    try {
      return right(await _userRemoteDataSource.getMyOrders());
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> orderAll() async {
    try {
      await _userRemoteDataSource.orderAll();
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CoffeeEntity>>> getFavoritesCoffee() async {
    try {
      String? uid = await _userLocalDataSource.getUserID();
      if (uid == null) {
        return right([]);
      }
      List<CoffeeEntity> favCoffee = [];
      favCoffee = _userLocalDataSource.getFavoritesCoffee();

      if (favCoffee.isEmpty) {
        favCoffee = await _userRemoteDataSource.getFavoritesCoffee();
      }
      FirebaseFirestore.instance
          .collection(EndPoints.favorites)
          .doc(uid)
          .collection(EndPoints.userFavorites)
          .snapshots()
          .listen((snapshot) async {
        if (snapshot.docChanges.any((change) =>
            change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified ||
            change.type == DocumentChangeType.removed)) {
          favCoffee = await _userRemoteDataSource.getFavoritesCoffee();
        }
      });
      return right(favCoffee);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavoriteCoffee({required String id}) async {
    String? uid = await _userLocalDataSource.getUserID();
    if (uid == null) {
      return right(false);
    }
    try {
      bool isExist = _userLocalDataSource.isFavoriteCoffee(id: id);
      FirebaseFirestore.instance
          .collection(EndPoints.favorites)
          .doc(uid)
          .collection(EndPoints.userFavorites)
          .snapshots()
          .listen((snapshot) async {
        if (snapshot.docChanges.any((change) =>
            change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified ||
            change.type == DocumentChangeType.removed)) {
          isExist = await _userRemoteDataSource.isFavoriteCoffee(id: id);
        }
      });
      return right(isExist);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFavoriteItem({required String id}) async {
    try {
      await _userRemoteDataSource.deleteFavoriteItem(id: id);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addFavoriteCoffee(
      {required CoffeeEntity coffee}) async {
    try {
      await _userRemoteDataSource.addFavoriteItem(coffee: coffee);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> handleFavoriteCoffee(
      {required CoffeeEntity coffee, required bool isExist}) async {
    try {
      if (isExist) {
        await deleteFavoriteItem(id: coffee.id!);
      } else {
        await addFavoriteCoffee(coffee: coffee);
      }
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserInfo(
      {required Map<String, dynamic> body}) async {
    try {
      await _userRemoteDataSource.updateUserInfo(body: body);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShopInfoEntity>> getShopInfo() async {
    try {
      ShopInfoEntity? shopInfo = _userLocalDataSource.getShopInfo();
      shopInfo ??= await _userRemoteDataSource.getShopInfo();
      FirebaseFirestore.instance
          .collection(EndPoints.shopInfo)
          .snapshots()
          .listen((snapshot) async {
        if (snapshot.docChanges.any((change) =>
            change.type == DocumentChangeType.added ||
            change.type == DocumentChangeType.modified ||
            change.type == DocumentChangeType.removed)) {
          shopInfo = await _userRemoteDataSource.getShopInfo();
        }
      });
      return right(shopInfo ?? ShopInfoEntity());
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> pay(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await _userRemoteDataSource.pay(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      if (e is DioException) {
        log(e.toString());
        return left(DioFailure.fromDioException(e));
      }
      log(e.toString());

      return left(FireBaseError(errMessage: e.toString()));
    }
  }
}
