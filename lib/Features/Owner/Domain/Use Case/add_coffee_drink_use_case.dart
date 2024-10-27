import 'package:coffee_oasis/Core/NetWork/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class AddCoffeeDrinkUseCase extends UseCase<void,List<dynamic>> {
  final OwnerRepo _ownerRepo;

  AddCoffeeDrinkUseCase(this._ownerRepo);

  @override
  Future<Either<Failure, void>> execute({List<dynamic>? param}) async {
     return await _ownerRepo.addCoffeeDrink(coffeeEntity: param![0], docId: param[1]);
  }
}
