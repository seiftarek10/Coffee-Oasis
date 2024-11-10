import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';

class OrderModel extends OrderEntity {
  final String cartItemId;
  final int cartCounter;
  final CoffeeEntity cartCoffee;
  OrderModel(this.cartItemId, this.cartCounter, this.cartCoffee)
      : super(id: cartItemId, counter: cartCounter, coffee: cartCoffee);

  factory OrderModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return OrderModel(json.id, json.data()['counter'],
        CoffeeEntity.fromJson(json.data()['coffee']));
  }
}
