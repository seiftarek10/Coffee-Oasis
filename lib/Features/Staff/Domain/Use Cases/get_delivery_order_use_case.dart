import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Repo/staff_repo.dart';
import 'package:dartz/dartz.dart';

class StaffGetDeliveryOrdersUseCase {
  final StaffRepo _staffRepo;

  StaffGetDeliveryOrdersUseCase(this._staffRepo);
  Stream<Either<Failure, List<UserOrderEntity>>> execute() {
    return _staffRepo.getDeliveryOrders();
  }
}
