import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Repo/staff_repo.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:dartz/dartz.dart';

class StaffGetAllOrdersUseCase {
  final StaffRepo _staffRepo;

  StaffGetAllOrdersUseCase(this._staffRepo);
  Stream<Either<Failure, List<OrderItemEntity>>> execute(
      {required bool isDelivery}) {
    return _staffRepo.getAllOrders(isDelivery: isDelivery);
  }
}
