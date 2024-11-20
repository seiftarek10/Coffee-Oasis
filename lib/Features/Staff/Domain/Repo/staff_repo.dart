import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:dartz/dartz.dart';

abstract class StaffRepo {
  Stream<Either<Failure, List<UserOrderEntity>>> getPickupOrders();
  Stream<Either<Failure, List<UserOrderEntity>>> getDeliveryOrders();
  Future<Either<Failure, void>> submitDeliveryOrder(
      {required UserOrderEntity userOrder});
  Future<Either<Failure, void>> submitPickuoOrder(
      {required UserOrderEntity userOrder});
}
