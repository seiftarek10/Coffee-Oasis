import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class AddToCartUseCase extends UseCase<void, OrderItemEntity> {
  final UserRepo _userRepo;

  AddToCartUseCase(this._userRepo);
  @override
  Future<Either<Failure, void>> execute({OrderItemEntity? param}) async {
    return _userRepo.addToCart(coffeeItem: param!);
  }
}
