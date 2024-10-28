import 'package:coffee_oasis/Core/Constant/boxes_name.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class OwnerLocalDataSource {
  Future<void> saveCategories({required List<CategoryEntity> categories});
  Future<List<CategoryEntity>> getCategories();
  Future<void> deleteCategory({required int index});
  Future<void> updateCategory(
      {required int index, required CategoryEntity updatedCategory});
  Future<void> clearBox();
}

class OwnerLocalDataSourceImpl implements OwnerLocalDataSource {
  @override
  Future<void> saveCategories(
      {required List<CategoryEntity> categories}) async {
    var box = await Hive.openBox<CategoryEntity>(BoxesName.categoriesBox);
   await  box.addAll(categories);
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    var box = await Hive.openBox<CategoryEntity>(BoxesName.categoriesBox);
    return box.values.toList();
  }

  @override
  Future<void> deleteCategory({required int index}) async {
    var box = await Hive.openBox<CategoryEntity>(BoxesName.categoriesBox);
    await box.deleteAt(index);
  }

  @override
  Future<void> updateCategory(
      {required int index, required CategoryEntity updatedCategory}) async {
    var box = await Hive.openBox<CategoryEntity>(BoxesName.categoriesBox);
    await box.putAt(index, updatedCategory);
  }

  Future<void> clearBox() async {
    var box = await Hive.openBox<CategoryEntity>(BoxesName.categoriesBox);
    await box.clear();
  }
}
