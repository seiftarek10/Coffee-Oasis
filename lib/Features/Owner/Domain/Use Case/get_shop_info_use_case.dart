import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class OwnerGetShopInfoUseCase extends UseCase<ShopInfoEntity, bool> {
  final OwnerRepo _ownerRepo;

  OwnerGetShopInfoUseCase(this._ownerRepo);
  @override
  Future<Either<Failure, ShopInfoEntity>> execute({bool? param}) async {
    return await _ownerRepo.getShopInfo(remoteSource: param!);
  }
}
