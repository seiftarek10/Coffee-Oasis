import 'package:coffee_oasis/Core/NetWork/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateCoffeeDrinkUseCase extends UseCase<void, List<dynamic>> {
  final OwnerRepo _ownerRepo;

  UpdateCoffeeDrinkUseCase(this._ownerRepo);
  @override
  Future<Either<Failure, void>> execute({List<dynamic>? param}) async {
    return await _ownerRepo.updateCoffeeDrink(
        parentDocId: param![0], docId: param[1], body: param[2]);
  }
}
