import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/cart_item_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class AddToCartUseCase extends UseCase<void, CartItemEntity> {
  final UserRepo _userRepo;

  AddToCartUseCase(this._userRepo);
  @override
  Future<Either<Failure, void>> execute({CartItemEntity? param}) async {
    return _userRepo.addToCart(coffeeItem: param!);
  }
}
