import 'package:coffee_oasis/Core/Models/fire_base_path_param.dart';
import 'package:coffee_oasis/Core/NetWork/database_services.dart';
import 'package:coffee_oasis/Core/NetWork/endpoints.dart';
import 'package:coffee_oasis/Core/NetWork/storage_services.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/Owner/Data/Models/category_model.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';

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

  Future<void> deleteCategory({required String id, required String url}) async {
    await _databaseServices.deleteDoc(
        endPoint: Endpoints.categories, docId: id);
    await getIt.get<StorageService>().deletePhoto(url: url);
  }

  Future<void> updateCategory(
      {required String id, required Map<String, dynamic> body}) async {
    await _databaseServices.updateDoc(
        endPoint: Endpoints.categories, body: body, docId: id);
  }

  Future<void> addCoffeeDrink(
      {required CoffeeEntity coffeeEntity, required String docId}) async {
    await _databaseServices.postToSubCollection(
        fireBasePathParam: FireBasePathParam(
            parentCollection: Endpoints.categories,
            parentDocId: docId,
            subCollection: Endpoints.coffeeDrinks),
        body: coffeeEntity.toJson());
  }
}
