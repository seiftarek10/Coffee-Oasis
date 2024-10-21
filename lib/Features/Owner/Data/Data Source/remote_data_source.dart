

import 'package:coffee_oasis/Core/NetWork/database_services.dart';
import 'package:coffee_oasis/Core/NetWork/endpoints.dart';
import 'package:coffee_oasis/Features/Owner/Data/Models/category_model.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';

class OwnerRemoteDataSource {
  final DatabaseServices _databaseServices;

  OwnerRemoteDataSource(this._databaseServices);

  Future<void> addCategory({required CategoryEntity category}) async {
    await _databaseServices.post(
        endPoint: Endpoints.categories, body: category.toJson());
  }

  Future<List<CategoryEntity>> getAllCategories() async {
    var response =
        await _databaseServices.getCollection(endPoint: Endpoints.categories);
    List<CategoryEntity> categories = [];

    for (var item in response.docs) {
      categories.add(CategoryModel.fromJson(item));
    }
    return categories;
  }
}
