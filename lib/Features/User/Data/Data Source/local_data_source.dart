import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Constant/boxes_name.dart';
import 'package:coffee_oasis/Core/Constant/value_constant.dart';
import 'package:hive_flutter/adapters.dart';

abstract class UserLocalDataSource {
  Future<UserEntity?> getUserInfo();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  Future<String?> getUserID() async {
    Box<String> box = await Hive.openBox<String>(BoxesName.uidBox);

    return box.get(AppConstant.uid);
  }

  @override
  Future<UserEntity?> getUserInfo() async {
    String? uid = await getUserID();
    Box<UserEntity> box = Hive.box<UserEntity>(BoxesName.userBox);
    if (!box.containsKey(uid)) {
      return null;
    }
    UserEntity? user = box.get(uid);
    return user;
  }
}
