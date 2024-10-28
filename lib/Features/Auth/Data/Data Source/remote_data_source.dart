import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/NetWork/fire_auth_services.dart';
import 'package:coffee_oasis/Core/NetWork/fire_store_services.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Entity/user_entity.dart';

class AuthRemoteDataSource {
  final FireAuthServices _fireAuthServices;
  final FireStoreServices _fireStoreServices;

  AuthRemoteDataSource(this._fireAuthServices, this._fireStoreServices);
  Future<void> signUp({required UserEntity userEntity}) async {
    await _fireAuthServices.signUp(
        email: userEntity.email!, password: userEntity.password!);
    await _fireStoreServices.postDoc(
        endPoint: EndPoints.users, body: userEntity.toJson());
  }

  Future<void> signIn({required String email, required String password}) async {
    await _fireAuthServices.signIn(email: email, password: password);
  }
}
