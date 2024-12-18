import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class GetUserInfoUseCase extends UseCase<UserEntity, bool> {
  final UserRepo _userRepo;

  GetUserInfoUseCase(this._userRepo);
  @override
  Future<Either<Failure, UserEntity>> execute({bool? param}) async {
    return await _userRepo.getUserInfo(remoteSource: param!);
  }
}
