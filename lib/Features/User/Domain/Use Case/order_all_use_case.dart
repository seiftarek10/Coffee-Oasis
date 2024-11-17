import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class OrderAllUseCase extends UseCase<void, void> {
  final UserRepo _userRepo;

  OrderAllUseCase(this._userRepo);
  @override
  Future<Either<Failure, void>> execute({void param}) async {
    return await _userRepo.orderAll();
  }
}
