import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> getUserInfo({required bool remoteSource});
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure, List<CoffeeEntity>>> getCoffeeDrinks({String? id});
  Future<Either<Failure, void>> addToCart(
      {required OrderItemEntity coffeeItem});
  Future<Either<Failure, List<OrderItemEntity>>> getCartItems();
  Future<Either<Failure, void>> deleteCartItem({required String id});
  Future<Either<Failure, void>> makeOrder(
      {required UserOrderEntity order,
      required String id,
      required bool isDelivery,
      required bool fromCart});
  Future<Either<Failure, List<OrderItemEntity>>> getMyOrders();
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
  Future<Either<Failure, void>> payByStripe(
      {required PaymentIntentInputModel paymentIntentInputModel});
}
