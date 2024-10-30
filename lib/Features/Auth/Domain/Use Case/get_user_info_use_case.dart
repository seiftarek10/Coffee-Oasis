import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class GetUserInfoUseCase extends UseCase<UserEntity, String> {
  final AuthRepo _authRepo;

  GetUserInfoUseCase(this._authRepo);
  @override
  Future<Either<Failure, UserEntity>> execute({String? param}) async {
    return await _authRepo.getUserInfo(uid: param!);
  }
}
