import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateCategoryUseCase extends UseCase<void, List<dynamic>> {
  final OwnerRepo _ownerRepo;

  UpdateCategoryUseCase(this._ownerRepo);

  @override
  Future<Either<Failure, void>> execute({List<dynamic>? param}) async {
    return await _ownerRepo.updateCategory(id: param![0], body: param[1]);
  }
}
