import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/Models/user_model.dart';
import 'package:coffee_oasis/Core/NetWork/fire_store_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUserInfo();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FireStoreServices _fireStoreServices;

  UserRemoteDataSourceImpl(this._fireStoreServices);
  @override
  Future<UserEntity> getUserInfo() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>?> data =
        await _fireStoreServices.getDoc(endPoint: EndPoints.users, docId: uid);
    UserEntity user = UserModel.fromJson(data);
    return user;
  }
}
