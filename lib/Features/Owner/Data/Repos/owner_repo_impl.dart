import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class OwnerRepoImpl extends OwnerRepo {
  final OwnerRemoteDataSourceImpl _ownerRemoteDataSource;
  final OwnerLocalDataSource _ownerLocalDataSource;

  OwnerRepoImpl(this._ownerRemoteDataSource, this._ownerLocalDataSource);
  @override
  Future<Either<Failure, String>> addCategory(
      {required CategoryEntity category}) async {
    try {
      _ownerRemoteDataSource.addCategory(category: category);
      return right('Succeess');
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCategory(
      {required String id,
      required String? photoUrl,
      required int index}) async {
    try {
      await _ownerRemoteDataSource.deleteCategory(id: id, url: photoUrl);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCategory({
    required String id,
    required Map<String, dynamic> body,
  }) async {
    try {
      await _ownerRemoteDataSource.updateCategory(id: id, body: body);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> addCoffeeDrink(
      {required CoffeeEntity coffeeEntity, required String docId}) async {
    try {
      await _ownerRemoteDataSource.addCoffeeDrink(
          coffeeEntity: coffeeEntity, docId: docId);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CoffeeEntity>>> getCategoryCoffeeDrinks(
      {required String docId, required bool remoteSource}) async {
    try {
      List<CoffeeEntity> coffeeDrinks = [];
      coffeeDrinks = _ownerLocalDataSource.getCoffeeDrinks(id: docId);
      if (!remoteSource) {
        if (coffeeDrinks.isNotEmpty) {
          return right(coffeeDrinks);
        }
      }

      coffeeDrinks =
          await _ownerRemoteDataSource.getCategoryCoffeeDrinks(docId: docId);
      return right(coffeeDrinks);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCoffeeDrink({
    required String parentDocId,
    required String docId,
    required String photoUrl,
  }) async {
    try {
      await _ownerRemoteDataSource.deleteCoffeeDrink(
          parentDocId: parentDocId, docId: docId, photoUrl: photoUrl);

      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCoffeeDrink(
      {required String parentDocId,
      required String docId,
      required Map<String, dynamic> body}) async {
    try {
      await _ownerRemoteDataSource.updateCoffeeDrink(
          parentDocId: parentDocId, docId: docId, body: body);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShopInfoEntity>> getShopInfo(
      {required bool remoteSource}) async {
    try {
      ShopInfoEntity? shopInfoEntity;
      if (!remoteSource) {
        shopInfoEntity = _ownerLocalDataSource.getShopInfo();
        if (shopInfoEntity != null) {
          return right(shopInfoEntity);
        }
      }
      return right(await _ownerRemoteDataSource.getShopInfo());
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateShopInfo(
      Map<String, dynamic> body) async {
    try {
      await _ownerRemoteDataSource.updateShopInfo(body: body);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories(
      {bool? remoteSource}) async {
    try {
      List<CategoryEntity> categories = [];
      categories = _ownerLocalDataSource.getCategories();
      if (categories.isEmpty || remoteSource != null) {
        categories = await _ownerRemoteDataSource.getAllCategories();
        await _ownerLocalDataSource.saveCategories(categories: categories);
        return right(categories);
      }
      return right(categories);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }
}
