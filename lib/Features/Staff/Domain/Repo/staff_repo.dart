import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:dartz/dartz.dart';

abstract class StaffRepo {
  Stream<Either<Failure, List<OrderEntity>>> getAllOrders(
      {required bool isDelivery});
  Stream<Either<Failure, List<OrderEntity>>> getUserOrders(
      {required bool isDelivery, required String id});
}
