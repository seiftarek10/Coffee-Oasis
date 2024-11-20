import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Repo/staff_repo.dart';
import 'package:dartz/dartz.dart';

class SubmitPickUpOrderUseCase extends UseCase<void, UserOrderEntity> {
  final StaffRepo _staffRepo;

  SubmitPickUpOrderUseCase(this._staffRepo);
  @override
  Future<Either<Failure, void>> execute({UserOrderEntity? param}) async {
    return await _staffRepo.submitPickuoOrder(userOrder: param!);
  }
}
