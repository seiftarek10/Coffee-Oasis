import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/NetWork/fire_auth_services.dart';
import 'package:coffee_oasis/Core/NetWork/fire_store_services.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Features/Auth/Data/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  final FireAuthServices _fireAuthServices;
  final FireStoreServices _fireStoreServices;

  AuthRemoteDataSource(this._fireAuthServices, this._fireStoreServices);
  Future<void> signUp({required UserEntity userEntity}) async {
    UserCredential user = await _fireAuthServices.signUp(
        email: userEntity.email!, password: userEntity.password!);
    userEntity.uid = user.user!.uid;
    await _fireStoreServices.postDocWithId(
        endPoint: EndPoints.users,
        body: userEntity.toJson(),
        id: user.user!.uid);
  }

  Future<UserCredential> signIn(
      {required String email, required String password}) async {
    return await _fireAuthServices.signIn(email: email, password: password);
  }

  Future<UserEntity> getUser({required String id}) async {
    var response =
        await _fireStoreServices.getDoc(endPoint: EndPoints.users, docId: id);
    return UserModel.fromJson(response);
  }
}
