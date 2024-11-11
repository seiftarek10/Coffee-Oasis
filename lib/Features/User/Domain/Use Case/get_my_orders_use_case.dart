import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class GetMyOrdersUseCase extends UseCase<List<OrderEntity>, void> {
  final UserRepo _userRepo;

  GetMyOrdersUseCase(this._userRepo);
  @override
  Future<Either<Failure, List<OrderEntity>>> execute({void param}) async {
    return await _userRepo.getMyOrders();
  }
}