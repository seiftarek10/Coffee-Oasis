import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class UserGetCoffeeDrinksUseCase extends UseCase<List<CoffeeEntity>, String> {
  final UserRepo _userRepo;

  UserGetCoffeeDrinksUseCase(this._userRepo);
  @override
  Future<Either<Failure, List<CoffeeEntity>>> execute({String? param}) async {
    return await _userRepo.getCoffeeDrinks(id: param);
  }
}
