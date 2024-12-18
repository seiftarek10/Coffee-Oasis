import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/boxes_name.dart';
import 'package:coffee_oasis/Core/Constant/value_constant.dart';
import 'package:hive_flutter/adapters.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUserInfo({required UserEntity user});
  Future<void> saveUserId({required String uid});
  Future<void> signOut();
}

class AuthLoaclaDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> saveUserInfo({required UserEntity user}) async {
    var box = Hive.box<UserEntity>(BoxesName.userBox);
    if (box.containsKey(user.uid)) {
      return;
    }
    await box.put(user.uid, user);
  }

  @override
  Future<void> saveUserId({required String uid}) async {
    var box = Hive.box<String>(BoxesName.uidBox);
    if (box.containsKey(uid)) {
      return;
    }
    await box.put(AppConstant.uidKey, uid);
  }

  @override
  Future<void> signOut() async {
    var box = Hive.box<UserEntity>(BoxesName.userBox);
    var uid = Hive.box<String>(BoxesName.uidBox);
    await box.clear();
    await uid.clear();
  }
}
