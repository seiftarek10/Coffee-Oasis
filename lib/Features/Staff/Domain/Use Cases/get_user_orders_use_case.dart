
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Repo/staff_repo.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:dartz/dartz.dart';

class StaffGetUserOrdersUseCase {
  final StaffRepo _staffRepo;

  StaffGetUserOrdersUseCase(this._staffRepo);
  Stream<Either<Failure, List<OrderEntity>>> execute(
      {required bool isDelivery, required String id}) {
    return _staffRepo.getUserOrders(isDelivery: isDelivery, id: id);
  }
}
