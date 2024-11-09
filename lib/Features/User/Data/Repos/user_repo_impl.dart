import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/cart_item_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      if (!remoteSource || user != null) {
        return right(user!);
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
      final completer = Completer<Either<Failure, List<CategoryEntity>>>();
      if (categories.isEmpty) {
        categories = await _userRemoteDataSource.getAllCategories();
        await _userLocalDataSource.saveCategories(categories);
      }
      completer.complete(right(categories));

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

      return completer.future;
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
        coffeeDrinks = await handleGetAllCoffee();
      } else {
        coffeeDrinks = await getSpecificCategoryCoffeeDrinks(id: id);
      }

      return right(coffeeDrinks);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  Future<List<CoffeeEntity>> handleGetAllCoffee() async {
    List<CoffeeEntity> coffeeDrinks;

    coffeeDrinks = _userLocalDataSource.getAllCoffee();
    if (coffeeDrinks.isEmpty) {
      coffeeDrinks = await _userRemoteDataSource.getAllCoffee();
    }
    FirebaseFirestore.instance
        .collection(EndPoints.coffeeDrinks)
        .snapshots()
        .listen((snapshot) async {
      if (snapshot.docChanges.any((change) =>
          change.type == DocumentChangeType.added ||
          change.type == DocumentChangeType.modified ||
          change.type == DocumentChangeType.removed)) {
        coffeeDrinks = await _userRemoteDataSource.getAllCoffee();
      }
    });

    return coffeeDrinks;
  }

  Future<List<CoffeeEntity>> getSpecificCategoryCoffeeDrinks(
      {required String id}) async {
    List<CoffeeEntity> coffeeDrinks;

    coffeeDrinks = _userLocalDataSource.getCoffeeDrinks(id: id);
    if (coffeeDrinks.isEmpty) {
      coffeeDrinks = await _userRemoteDataSource.getCoffeeDrinks(id: id);
    }
    FirebaseFirestore.instance
        .collection(EndPoints.coffeeDrinks)
        .snapshots()
        .listen((snapshot) async {
      if (snapshot.docChanges.any((change) =>
          change.type == DocumentChangeType.added ||
          change.type == DocumentChangeType.modified ||
          change.type == DocumentChangeType.removed)) {
        coffeeDrinks = await _userRemoteDataSource.getCoffeeDrinks(id: id);
      }
    });

    return coffeeDrinks;
  }

  @override
  Future<Either<Failure, void>> addToCart(
      {required CartItemEntity coffeeItem}) async {
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
  Future<Either<Failure, List<CartItemEntity>>> getCartItems() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      List<CartItemEntity> cartItem = [];
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
}
