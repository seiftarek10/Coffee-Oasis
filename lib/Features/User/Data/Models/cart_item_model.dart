import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  final String cartItemId;
  final int cartCounter;
  final CoffeeEntity cartCoffee;
  CartItemModel(this.cartItemId, this.cartCounter, this.cartCoffee)
      : super(id: cartItemId, counter: cartCounter, coffee: cartCoffee);

  factory CartItemModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return CartItemModel(json.id, json.data()['counter'],
        CoffeeEntity.fromJson(json.data()['coffee']));
  }
}
