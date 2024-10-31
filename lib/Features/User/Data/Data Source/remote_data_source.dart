import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/Models/category_model.dart';
import 'package:coffee_oasis/Core/Models/user_model.dart';
import 'package:coffee_oasis/Core/NetWork/fire_store_services.dart';
import 'package:coffee_oasis/Features/User/Data/Data%20Source/local_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> getUserInfo();
  Future<List<CategoryEntity>> getAllCategories();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final FireStoreServices _fireStoreServices;
  final UserLocalDataSource userLocalDataSource;

  UserRemoteDataSourceImpl(this._fireStoreServices, this.userLocalDataSource);
  @override
  Future<UserEntity> getUserInfo() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>?> data =
        await _fireStoreServices.getDoc(endPoint: EndPoints.users, docId: uid);
    UserEntity user = UserModel.fromJson(data);
    return user;
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> data =
        await _fireStoreServices.getCollection(endPoint: EndPoints.categories);
    List<CategoryEntity> allCategoires = [];
    for (var category in data.docs) {
      allCategoires.add(CategoryModel.fromJson(category));
    }
    userLocalDataSource.saveCategories(allCategoires);
    return allCategoires;
  }
}
