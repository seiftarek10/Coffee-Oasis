import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

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
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories(
      {required bool firstTime}) async {
    try {
      List<CategoryEntity> categories = [];

      categories = await _userLocalDataSource.getAllCategories();
      final completer = Completer<Either<Failure, List<CategoryEntity>>>();
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
          await _userLocalDataSource.saveCategories(categories);
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

  // @override
  // Future<Either<Failure, List<CategoryEntity>>> getAllCategories(
  //     {required bool firstTime}) async {
  //   try {
  //     List<CategoryEntity> categories = [];
  //     final Completer<Either<Failure, List<CategoryEntity>>> completer =
  //         Completer();

  //     FirebaseFirestore.instance
  //         .collection(EndPoints.categories)
  //         .snapshots()
  //         .listen((snapshot) async {
  //       if (snapshot.docChanges.any((change) =>
  //           change.type == DocumentChangeType.added ||
  //           change.type == DocumentChangeType.modified ||
  //           change.type == DocumentChangeType.removed)) {
  //         categories = await _userRemoteDataSource.getAllCategories();
  //         await _userLocalDataSource.saveCategories(categories);
  //         print('remote');
  //         print('====================================================');
  //         if (!completer.isCompleted) {
  //           completer.complete(right(categories));
  //         }
  //       } else {
  //         print('local');
  //         print('====================================================');
  //         categories = await _userLocalDataSource.getAllCategories();
  //         if (!completer.isCompleted) {
  //           completer.complete(right(categories));
  //         }
  //       }
  //     });

  //     return completer.future;
  //   } catch (e) {
  //     if (e is FirebaseException) {
  //       return left(FireBaseError.firebaseException(e));
  //     }
  //     return left(FireBaseError(errMessage: e.toString()));
  //   }
  // }
}
