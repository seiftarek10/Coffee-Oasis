import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class UpdateUserInfoUseCase extends UseCase<void, Map<String, dynamic>> {
  final UserRepo _userRepo;

  UpdateUserInfoUseCase(this._userRepo);
  @override
  Future<Either<Failure, void>> execute({Map<String, dynamic>? param}) async {
    return await _userRepo.updateUserInfo(body: param!);
  }
}
