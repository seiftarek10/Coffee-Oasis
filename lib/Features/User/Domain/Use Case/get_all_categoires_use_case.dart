import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class UserGetAllCategoiresUseCase extends UseCase<List<CategoryEntity>, bool> {
  final UserRepo userRepo;

  UserGetAllCategoiresUseCase(this.userRepo);
  @override
  Future<Either<Failure, List<CategoryEntity>>> execute({bool? param}) async {
    return userRepo.getAllCategories(firstTime: param!);
  }
}
