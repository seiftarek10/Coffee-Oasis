import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class OwnerRepoImpl extends OwnerRepo {
  final OwnerRemoteDataSource _ownerRemoteDataSource;

  OwnerRepoImpl(this._ownerRemoteDataSource);
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
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      List<CategoryEntity> categories =
          await _ownerRemoteDataSource.getAllCategories();
      return right(categories);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCategory({required String id,required String url}) async {
    try {
      await _ownerRemoteDataSource.deleteCategory(id: id,url: url);
      return right('Success');
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }
}
