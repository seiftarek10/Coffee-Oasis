import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Constant/boxes_name.dart';
import 'package:hive_flutter/adapters.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUserInfo({required UserEntity user});
  Future<UserEntity> getUserInfo({required String id});
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
  Future<UserEntity> getUserInfo({required String id}) async {
    var box = Hive.box<UserEntity>(BoxesName.userBox);
    return box.get(id)!;
  }
}
