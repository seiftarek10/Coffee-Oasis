import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Auth/Data/Data%20Source/remote_data_source.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Entity/user_entity.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);
  @override
  Future<Either<Failure, void>> signUp({required UserEntity userEntity}) async {
    try {
      await _authRemoteDataSource.signUp(userEntity: userEntity);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(
            FireBaseError(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return left(FireBaseError(
            errMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      if (e is FirebaseException) {
        return left(FireBaseError.firebaseException(e));
      }
      return left(FireBaseError(errMessage: e.toString()));
    }
    return left(FireBaseError(errMessage: 'error'));
  }

  @override
  Future<Either<Failure, void>> signIn(
      {required String email, required String password}) async {
    try {
      await _authRemoteDataSource.signIn(email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(FireBaseError(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return left(FireBaseError(
            errMessage: 'Wrong email or password provided for that user.'));
      }
    }
    return left(FireBaseError(errMessage: 'Some Thing Is Wrong'));
  }





}
