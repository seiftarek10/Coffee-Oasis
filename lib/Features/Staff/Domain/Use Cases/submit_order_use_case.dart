import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Repo/staff_repo.dart';
import 'package:dartz/dartz.dart';

class SubmitOrderUseCase extends UseCase<void, List<String>> {
  final StaffRepo _staffRepo;

  SubmitOrderUseCase(this._staffRepo);
  @override
  Future<Either<Failure, void>> execute({List<String>? param}) async {
    return await _staffRepo.submitOrder(orderId: param![0], coffeeId: param[1]);
  }
}
