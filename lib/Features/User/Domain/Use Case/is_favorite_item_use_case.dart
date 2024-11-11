import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class IsFavoriteItemUseCase extends UseCase<bool, String> {
  final UserRepo _userRepo;

  IsFavoriteItemUseCase(this._userRepo);
  @override
  Future<Either<Failure, bool>> execute({String? param}) async {
    return await _userRepo.isFavoriteCoffee(id: param!);
  }
}
