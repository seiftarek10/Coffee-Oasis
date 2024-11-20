import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';

import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';

class OrderModel extends OrderItemEntity {
  final String cartItemId;
  final int cartCounter;
  final num? orderPrice;
  final bool? orderisDelivery;
  final bool? orderisFinished;
  final CoffeeEntity cartCoffee;
  final String? dateTime;

  OrderModel(
      this.cartItemId,
      this.cartCounter,
      this.orderPrice,
      this.orderisDelivery,
      this.orderisFinished,
      this.cartCoffee,
      this.dateTime)
      : super(
            id: cartItemId,
            counter: cartCounter,
            price: orderPrice,
            isDelivery: orderisDelivery,
            isFinished: orderisFinished,
            coffee: cartCoffee,
            date: dateTime);

  factory OrderModel.fromJson(Map<String, dynamic> json, String id) {
    return OrderModel(
        id,
        json['counter'],
        json['price'] ?? 0,
        json['isDelivery'] ?? true,
        json['isFinished'] ?? false,
        CoffeeEntity.fromJson(json['coffee']),
        json['Date'] ?? DateTime.now().toString());
  }

  factory OrderModel.fromStream(QueryDocumentSnapshot<Object?> json) {
    final data = json.data() as Map<String, dynamic>;

    return OrderModel(
        json.id,
        data['counter'] ?? 0,
        data['price'] as int? ?? 0.0,
        data['isDelivery'] as bool? ?? true,
        data['isFinished'] as bool? ?? false,
        CoffeeEntity.fromJson(data['coffee'] as Map<String, dynamic>),
        json['Date'] ?? DateTime.now());
  }
}
