import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';

class OrderModel extends OrderEntity {
  final String cartItemId;
  final int cartCounter;
  final bool? orderisDelivery;
  final bool? orderisFinished;
  final CoffeeEntity cartCoffee;
  OrderModel(this.cartItemId, this.cartCounter, this.orderisDelivery,
      this.orderisFinished, this.cartCoffee)
      : super(
            id: cartItemId,
            counter: cartCounter,
            isDelivery: orderisDelivery,
            isFinished: orderisFinished,
            coffee: cartCoffee);

  factory OrderModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return OrderModel(
        json.id,
        json.data()['counter'],
        json.data()['isDelivery'],
        json.data()['isFinished'],
        CoffeeEntity.fromJson(json.data()['coffee']));
  }
}
