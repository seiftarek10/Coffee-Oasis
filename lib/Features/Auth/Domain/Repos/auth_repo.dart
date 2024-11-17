import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signUp({required UserEntity userEntity});
  Future<Either<Failure, void>> signIn(
      {required String email, required String password});
  Future<UserEntity> getUserInfo({required String uid});
  Future<Either<Failure, void>> signOut();
}
