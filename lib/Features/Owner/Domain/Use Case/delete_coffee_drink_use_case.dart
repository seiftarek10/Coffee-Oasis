import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteCoffeeDrinkUseCase extends UseCase<void, List<dynamic>> {
  final OwnerRepo _ownerRepo;

  DeleteCoffeeDrinkUseCase(this._ownerRepo);
  @override
  Future<Either<Failure, void>> execute({List<dynamic>? param}) async {
    return await _ownerRepo.deleteCoffeeDrink(
        parentDocId: param![0], docId: param[1], photoUrl: param[2]);
  }
}
