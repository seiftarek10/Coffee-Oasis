import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/cart_item_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class GetCartItemsUseCase extends UseCase<List<CartItemEntity>, void> {
  final UserRepo _userRepo;

  GetCartItemsUseCase(this._userRepo);
  @override
  Future<Either<Failure, List<CartItemEntity>>> execute({param}) async {
    return _userRepo.getCartItems();
  }
}
