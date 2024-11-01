import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/boxes_name.dart';
import 'package:coffee_oasis/Core/Constant/value_constant.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/hive_services.dart';
import 'package:hive_flutter/adapters.dart';

abstract class UserLocalDataSource {
  Future<UserEntity?> getUserInfo();
  Future<void> saveCategories(List<CategoryEntity> categories);
  Future<List<CategoryEntity>> getAllCategories();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final HiveServices<UserEntity> userInfoHiveServices;
  final HiveServices<CategoryEntity> categoryHiveServices;

  UserLocalDataSourceImpl(
      {required this.userInfoHiveServices, required this.categoryHiveServices});
  Future<String?> getUserID() async {
    Box<String> box = await Hive.openBox<String>(BoxesName.uidBox);
    return box.get(AppConstant.uid);
  }

  @override
  Future<UserEntity?> getUserInfo() async {
    String? uid = await getUserID();

    UserEntity? user = userInfoHiveServices.getByKey(objectKey: uid);
    return user;
  }

  @override
  Future<void> saveCategories(List<CategoryEntity> categories) async {
    await categoryHiveServices.saveData(categories);
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    return categoryHiveServices.getData();
  }
}
