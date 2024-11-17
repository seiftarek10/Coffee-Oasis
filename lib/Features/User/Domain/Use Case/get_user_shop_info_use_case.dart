import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class UserGetShopInfoUseCase extends UseCase<ShopInfoEntity, void> {
  final UserRepo _userRepo;

  UserGetShopInfoUseCase(this._userRepo);
  @override
  Future<Either<Failure, ShopInfoEntity>> execute({void param}) async {
    return await _userRepo.getShopInfo();
  }
}
