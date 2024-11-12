import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';

class OrderModel extends OrderEntity {
  final String cartItemId;
  final int cartCounter;
  final num? orderPrice;
  final bool? orderisDelivery;
  final bool? orderisFinished;
  final CoffeeEntity cartCoffee;
  OrderModel(this.cartItemId, this.cartCounter, this.orderPrice,
      this.orderisDelivery, this.orderisFinished, this.cartCoffee)
      : super(
            id: cartItemId,
            counter: cartCounter,
            price: orderPrice,
            isDelivery: orderisDelivery,
            isFinished: orderisFinished,
            coffee: cartCoffee);

  factory OrderModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return OrderModel(
        json.id,
        json.data()['counter'],
        json.data()['price'] ?? 0,
        json.data()['isDelivery'],
        json.data()['isFinished'],
        CoffeeEntity.fromJson(json.data()['coffee']));
  }
}
