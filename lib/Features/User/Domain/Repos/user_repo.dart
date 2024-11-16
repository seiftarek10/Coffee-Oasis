import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> getUserInfo({required bool remoteSource});
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, List<CoffeeEntity>>> getCoffeeDrinks({String? id});
  Future<Either<Failure, void>> addToCart({required OrderEntity coffeeItem});
  Future<Either<Failure, List<OrderEntity>>> getCartItems();
  Future<Either<Failure, void>> deleteCartItem({required String id});
  Future<Either<Failure, void>> makeOrder({required OrderEntity order});
  Future<Either<Failure, List<OrderEntity>>> getMyOrders();
  Future<Either<Failure, void>> orderAll();
  Future<Either<Failure, void>> addFavoriteCoffee(
      {required CoffeeEntity coffee});
  Future<Either<Failure, bool>> isFavoriteCoffee({required String id});
  Future<Either<Failure, List<CoffeeEntity>>> getFavoritesCoffee();
  Future<Either<Failure, void>> deleteFavoriteItem({required String id});
  Future<Either<Failure, void>> handleFavoriteCoffee(
      {required CoffeeEntity coffee, required bool isExist});
  Future<Either<Failure, void>> updateUserInfo(
      {required Map<String, dynamic> body});

  Future<Either<Failure, ShopInfoEntity>> getShopInfo();
}
