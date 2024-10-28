import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class GetAllCategoriesUseCase extends UseCase<List<CategoryEntity>, bool> {
  final OwnerRepo _ownerRepo;

  GetAllCategoriesUseCase(this._ownerRepo);
  @override
  Future<Either<Failure, List<CategoryEntity>>> execute({bool? param}) async {
    return await _ownerRepo.getAllCategories(remoteSource: param!);
  }
}
