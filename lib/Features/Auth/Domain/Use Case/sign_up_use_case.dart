import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase extends UseCase<void, UserEntity> {
  final AuthRepo _authRepo;

  SignUpUseCase(this._authRepo);
  @override
  Future<Either<Failure, void>> execute({UserEntity? param}) async {
    return await _authRepo.signUp(userEntity: param!);
  }
}
