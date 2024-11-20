import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Staff/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Repo/staff_repo.dart';
import 'package:dartz/dartz.dart';

class StaffRepoImpl implements StaffRepo {
  final StaffRemoteDataSource _staffRemoteDataSource;

  StaffRepoImpl({required StaffRemoteDataSource staffRemoteDataSource})
      : _staffRemoteDataSource = staffRemoteDataSource;

  @override
  Stream<Either<Failure, List<UserOrderEntity>>> getDeliveryOrders() {
    try {
      Stream<List<UserOrderEntity>> orders =
          _staffRemoteDataSource.getDeliveryOrders();
      return orders.map((order) => right(order));
    } catch (e) {
      if (e is FirebaseException) {
        return Stream.value(left(FireBaseError.firebaseException(e)));
      }
      return Stream.value(left(FireBaseError(errMessage: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> submitDeliveryOrder(
      {required UserOrderEntity userOrder}) async {
    try {
      await _staffRemoteDataSource.submitDeliveryOrder(userOrder: userOrder);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<UserOrderEntity>>> getPickupOrders() {
    try {
      Stream<List<UserOrderEntity>> orders =
          _staffRemoteDataSource.getPickupOrders();
      return orders.map((order) => right(order));
    } catch (e) {
      if (e is FirebaseException) {
        return Stream.value(left(FireBaseError.firebaseException(e)));
      }
      return Stream.value(left(FireBaseError(errMessage: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> submitPickuoOrder(
      {required UserOrderEntity userOrder}) async {
    try {
      await _staffRemoteDataSource.submitPickUpyOrder(userOrder: userOrder);
      return right(unit);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }
}
