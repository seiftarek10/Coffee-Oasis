import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class GetFavoriteCoffeeUseCase extends UseCase<List<CoffeeEntity>, void> {
  final UserRepo _userRepo;

  GetFavoriteCoffeeUseCase(this._userRepo);
  @override
  Future<Either<Failure, List<CoffeeEntity>>> execute({void param}) async {
    return await _userRepo.getFavoritesCoffee();
  }
}
