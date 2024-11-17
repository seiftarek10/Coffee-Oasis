import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class HandleFavCoffeeUseCase extends UseCase<void, List<dynamic>> {
  final UserRepo _userRepo;

  HandleFavCoffeeUseCase(this._userRepo);
  @override
  Future<Either<Failure, void>> execute({List<dynamic>? param}) async {
    return await _userRepo.handleFavoriteCoffee(
        coffee: param![0], isExist: param[1]);
  }
}
