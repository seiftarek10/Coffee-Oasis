import 'package:coffee_oasis/Core/NetWork/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class GetShopInfoUseCase extends UseCase<ShopInfoEntity, void> {
  final OwnerRepo _ownerRepo;

  GetShopInfoUseCase(this._ownerRepo);
  @override
  Future<Either<Failure, ShopInfoEntity>> execute({param}) async {
    return await _ownerRepo.getShopInfo();
  }
}
