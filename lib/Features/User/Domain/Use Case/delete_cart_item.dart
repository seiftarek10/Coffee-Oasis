import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class DeleteCartItemUseCase extends UseCase<void, String> {
  final UserRepo _userRepo;

  DeleteCartItemUseCase(this._userRepo);

  @override
  Future<Either<Failure, void>> execute({String? param}) async {
    return await _userRepo.deleteCartItem(id: param!);
  }
}
