import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Repos/owner_repo.dart';
import 'package:dartz/dartz.dart';

class AddCategorUseCase extends UseCase<String, CategoryEntity> {
  final OwnerRepo ownerRepo;

  AddCategorUseCase({required this.ownerRepo});

  @override
  Future<Either<Failure, String>> execute({CategoryEntity? param}) {
    return ownerRepo.addCategory(category: param!);
  }
}
