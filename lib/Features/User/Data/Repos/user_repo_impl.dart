import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserRepoImpl implements UserRepo {
  final UserRemoteDataSource _userRemoteDataSource;
  final UserLocalDataSource _userLocalDataSource;

  UserRepoImpl(
      {required UserRemoteDataSource userRemoteDataSource,
      required UserLocalDataSource userLocalDataSource})
      : _userRemoteDataSource = userRemoteDataSource,
        _userLocalDataSource = userLocalDataSource;
  @override
  Future<Either<Failure, UserEntity>> getUserInfo(
      {required String userID, required bool remoteSource}) async {
    try {
      UserEntity? user = await _userLocalDataSource.getUserInfo();
      if (!remoteSource || user != null) {
        return right(user!);
      }
      user = await _userRemoteDataSource.getUserInfo();
      return right(user);
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
  }
}
