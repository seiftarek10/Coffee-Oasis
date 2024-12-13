import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Core/Models/order_model.dart';
import 'package:coffee_oasis/Core/Models/user_model.dart';

class UserOrderEntity {
  final String? id;
  final List<OrderItemEntity>? coffee;
  final UserEntity? user;

  UserOrderEntity({this.id, required this.coffee, required this.user});

  toJson() {
    return {
      'coffee': coffee
          ?.map((order) =>
              order.toOrderJson(date: order.date ?? DateTime.now().toString()))
          .toList(),
      'user': user?.toJson(),
    };
  }

  factory UserOrderEntity.fromStream(
      DocumentSnapshot<Map<String, dynamic>> json) {
    final data = json.data() as Map<String, dynamic>;
    final coffeeList = data['coffee'] as List<dynamic>;

    return UserOrderEntity(
      id: json.id,
      coffee: coffeeList
          .map((coffee) => OrderModel.fromJson(coffee, coffee['coffee']['id']))
          .toList(),
      user: UserModel.fromJson(data['user']),
    );
  }
}
