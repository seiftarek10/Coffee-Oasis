import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:dartz/dartz.dart';

abstract class StaffRepo {
  Stream<Either<Failure, List<UserOrderEntity>>> getAllOrders(
      {required bool isDelivery});
}
