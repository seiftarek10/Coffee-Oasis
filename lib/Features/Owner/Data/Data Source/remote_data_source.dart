import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/Models/fire_base_path_param.dart';
import 'package:coffee_oasis/Core/NetWork/fire_store_services.dart';
import 'package:coffee_oasis/Core/Constant/endpoints.dart';
import 'package:coffee_oasis/Core/NetWork/storage_services.dart';
import 'package:coffee_oasis/Features/Owner/Data/Data%20Source/local_data_source.dart';
import 'package:coffee_oasis/Core/Models/category_model.dart';
import 'package:coffee_oasis/Core/Models/coffee_drink_model.dart';
import 'package:coffee_oasis/Core/Models/coffee_drinks_hive_model.dart';
import 'package:coffee_oasis/Features/Owner/Data/Models/shop_info_model.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';

abstract class OwnerRemoteDataSource {
  Future<void> addCategory({required CategoryEntity category});
  Future<List<CategoryEntity>> getAllCategories();
  Future<void> deleteCategory({required String id, required String url});
  Future<void> updateCategory(
      {required String id, required Map<String, dynamic> body});
  Future<void> addCoffeeDrink(
      {required CoffeeEntity coffeeEntity, required String docId});
  Future<List<CoffeeEntity>> getCategoryCoffeeDrinks({required String docId});
  Future<void> deleteCoffeeDrink({
    required String parentDocId,
    required String docId,
    required String photoUrl,
  });
  Future<void> updateCoffeeDrink(
      {required String parentDocId,
      required String docId,
      required Map<String, dynamic> body});

  Future<ShopInfoEntity> getShopInfo();

  Future<void> updateShopInfo({required Map<String, dynamic> body});
}

class OwnerRemoteDataSourceImpl implements OwnerRemoteDataSource {
  final FireStoreServices _databaseServices;
  final StorageService _storageService;
  final OwnerLocalDataSource _ownerLocalDataSource;

  OwnerRemoteDataSourceImpl(
      this._databaseServices, this._storageService, this._ownerLocalDataSource);

  @override
  Future<void> addCategory({required CategoryEntity category}) async {
    await _databaseServices.postDoc(
        endPoint: EndPoints.categories, body: category.toJson());
  }

  @override
  Future<List<CategoryEntity>> getAllCategories() async {
    var response =
        await _databaseServices.getCollection(endPoint: EndPoints.categories);
    List<CategoryEntity> categories = [];

    for (var item in response.docs) {
      categories.add(CategoryModel.fromJson(item));
    }
    await _ownerLocalDataSource.saveCategories(categories: categories);

    return categories;
  }

  @override
  Future<void> deleteCategory({required String id, required String url}) async {
    await _databaseServices.deleteDoc(
        endPoint: EndPoints.categories, docId: id);
    await _storageService.deletePhoto(url: url);
  }

  @override
  Future<void> updateCategory(
      {required String id, required Map<String, dynamic> body}) async {
    await _databaseServices.updateDoc(
        endPoint: EndPoints.categories, body: body, docId: id);
  }

  @override
  Future<void> addCoffeeDrink(
      {required CoffeeEntity coffeeEntity, required String docId}) async {
    await _databaseServices.postToSubCollection(
        fireBasePathParam: FireBasePathParam(
            parentCollection: EndPoints.categories,
            parentDocId: docId,
            subCollection: EndPoints.coffeeDrinks),
        body: coffeeEntity.toJson());
  }

  @override
  Future<List<CoffeeEntity>> getCategoryCoffeeDrinks(
      {required String docId}) async {
    var response = await _databaseServices.getSubCollection(
        fireBasePathParam: FireBasePathParam(
            parentCollection: EndPoints.categories,
            parentDocId: docId,
            subCollection: EndPoints.coffeeDrinks));
    List<CoffeeEntity> coffeeDrinks = [];

    for (var item in response.docs) {
      coffeeDrinks.add(CoffeeDrinkModel.fromjson(item));
    }

    await _ownerLocalDataSource.saveCoffeeDrinks(
        coffeeDrinks:
            CoffeeDrinksHiveModel(id: docId, coffeeDrinks: coffeeDrinks));
    return coffeeDrinks;
  }

  @override
  Future<void> deleteCoffeeDrink({
    required String parentDocId,
    required String docId,
    required String photoUrl,
  }) async {
    await _databaseServices.deleteDocFromSubCollection(
        fireBasePathParam: FireBasePathParam(
            parentCollection: EndPoints.categories,
            parentDocId: parentDocId,
            subCollection: EndPoints.coffeeDrinks,
            subDocId: docId));
    await _storageService.deletePhoto(url: photoUrl);
  }

  @override
  Future<void> updateCoffeeDrink(
      {required String parentDocId,
      required String docId,
      required Map<String, dynamic> body}) async {
    await _databaseServices.updateDocFromSubCollection(
        fireBasePathParam: FireBasePathParam(
            parentCollection: EndPoints.categories,
            parentDocId: parentDocId,
            subCollection: EndPoints.coffeeDrinks,
            subDocId: docId),
        body: body);
  }

  @override
  Future<ShopInfoEntity> getShopInfo() async {
    DocumentSnapshot<Map<String, dynamic>?> response = await _databaseServices
        .getDoc(endPoint: EndPoints.shopInfo, docId: '1');

    ShopInfoEntity shopInfoEntity = ShopInfoModel.fromJson(response.data());
    await _ownerLocalDataSource.saveShopInfo(shopInfo: shopInfoEntity);
    return shopInfoEntity;
  }

  @override
  Future<void> updateShopInfo({required Map<String, dynamic> body}) async {
    await _databaseServices.updateDoc(
        endPoint: EndPoints.shopInfo, body: body, docId: '1');
  }
}
