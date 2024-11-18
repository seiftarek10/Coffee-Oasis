import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';

class UserOrderEntity {
  final String? id;
  final List<OrderItemEntity>? coffee;
  final UserEntity? user;

  UserOrderEntity({this.id, required this.coffee, required this.user});

  toJson() {
    return {
      'coffee': coffee?.map((order) => order.toOrderJson()).toList(),
      'user': user?.toJson()
    };
  }
}
