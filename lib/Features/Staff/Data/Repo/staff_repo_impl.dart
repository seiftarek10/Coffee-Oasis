import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Staff/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Repo/staff_repo.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:dartz/dartz.dart';

class StaffRepoImpl implements StaffRepo {
  final StaffRemoteDataSource _staffRemoteDataSource;

  StaffRepoImpl({required StaffRemoteDataSource staffRemoteDataSource})
      : _staffRemoteDataSource = staffRemoteDataSource;

  @override
  Stream<Either<Failure, List<OrderEntity>>> getUserOrders(
      {required bool isDelivery, required String id}) {
    try {
      Stream<List<OrderEntity>> ordersStream =
          _staffRemoteDataSource.getUserOrders(isDelivery: isDelivery, id: id);

      return ordersStream.map((orders) {
        return right(orders);
      });
    } catch (e) {
      if (e is FirebaseException) {
        return Stream.value(left(FireBaseError.firebaseException(e)));
      }
      return Stream.value(left(FireBaseError(errMessage: e.toString())));
    }
  }

  @override
  Stream<Either<Failure, List<OrderEntity>>> getAllOrders(
      {required bool isDelivery}) {
    try {
      Stream<List<OrderEntity>> orders =
          _staffRemoteDataSource.getAllOrders(isDelivery: isDelivery);
      return orders.map((order) => right(order));
    } catch (e) {
      if (e is FirebaseException) {
        return Stream.value(left(FireBaseError.firebaseException(e)));
      }
      return Stream.value(left(FireBaseError(errMessage: e.toString())));
    }
  }
}
