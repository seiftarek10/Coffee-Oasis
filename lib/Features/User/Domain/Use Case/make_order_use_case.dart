import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class MakeOrderUseCase extends UseCase<void, OrderEntity> {
  final UserRepo _userRepo;

  MakeOrderUseCase(this._userRepo);
  @override
  Future<Either<Failure, void>> execute({OrderEntity? param}) async {
    return await _userRepo.makeOrder(order: param!);
  }
}
