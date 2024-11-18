import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';

class UserOrderEntity {
  final String? id;
  final List<OrderEntity>? orders;
  final UserEntity? user;

  UserOrderEntity({required this.id, required this.orders, required this.user});

  toJson() {
    return {
      'orders': orders!.map((order) => order.toOrderJson()).toList(),
      'user': user?.toJson()
    };
  }
}
