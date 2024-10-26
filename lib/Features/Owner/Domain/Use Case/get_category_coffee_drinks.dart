import 'package:coffee_oasis/Core/NetWork/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class GetCategoryCoffeeDrinksUseCase extends UseCase<List<CoffeeEntity>, String> {
  final OwnerRepo _ownerRepo;

  GetCategoryCoffeeDrinksUseCase(this._ownerRepo);
  @override
  Future<Either<Failure, List<CoffeeEntity>>> execute({String? param}) async {
    return await _ownerRepo.getCategoryCoffeeDrinks(docId: param!);
  }
}