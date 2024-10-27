import 'package:coffee_oasis/Core/NetWork/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateShopInfoUseCase extends UseCase<void, Map<String, dynamic>> {
  final OwnerRepo _ownerRepo;

  UpdateShopInfoUseCase(this._ownerRepo);
  @override
  Future<Either<Failure, void>> execute({Map<String, dynamic>? param}) async {
    return await _ownerRepo.updateShopInfo(param!);
  }
}
