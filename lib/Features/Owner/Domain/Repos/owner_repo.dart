import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:dartz/dartz.dart';

abstract class OwnerRepo {
  Future<Either<Failure, String>> addCategory(
      {required CategoryEntity category});
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, void>> deleteCategory(
      {required String id, required String photoUrl});
  Future<Either<Failure, void>> updateCategory(
      {required String id, required Map<String, dynamic> body});
  Future<Either<Failure, void>> addCoffeeDrink(
      {required CoffeeEntity coffeeEntity, required String docId});
  Future<Either<Failure, List<CoffeeEntity>>> getCategoryCoffeeDrinks(
      {required String docId});
  Future<Either<Failure, void>> deleteCoffeeDrink(
      {required String parentDocId,
      required String docId,
      required String photoUrl});
  Future<Either<Failure, void>> updateCoffeeDrink(
      {required String parentDocId,
      required String docId,
      required Map<String, dynamic> body});

  Future<Either<Failure, ShopInfoEntity>> getShopInfo();
}
