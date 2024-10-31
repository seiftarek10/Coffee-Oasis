import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Hive%20Local%20Data%20Base/boxes_name.dart';
import 'package:coffee_oasis/Core/Constant/value_constant.dart';
import 'package:hive_flutter/adapters.dart';

abstract class UserLocalDataSource {
  Future<UserEntity?> getUserInfo();
  Future<void> saveCategories(List<CategoryEntity> categories);
  Future<List<CategoryEntity>> getAllCategories();
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

  Future<void> clearCategoriesBox() async {
    Box<CategoryEntity> box = Hive.box<CategoryEntity>(BoxesName.categoriesBox);
    await box.clear();
  }

  @override
  Future<void> saveCategories(List<CategoryEntity> categories) async {
    Box<CategoryEntity> box = Hive.box<CategoryEntity>(BoxesName.categoriesBox);
    await clearCategoriesBox();
    await box.addAll(categories);
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    Box<CategoryEntity> box = Hive.box<CategoryEntity>(BoxesName.categoriesBox);
    return box.values.toList();
  }
}
