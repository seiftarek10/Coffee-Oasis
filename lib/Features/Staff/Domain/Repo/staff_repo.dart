import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:dartz/dartz.dart';

abstract class StaffRepo {
  Stream<Either<Failure, List<OrderItemEntity>>> getAllOrders(
      {required bool isDelivery});
  Stream<Either<Failure, List<OrderItemEntity>>> getUserOrders(
      {required bool isDelivery, required String id});
}
