import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:hive_flutter/adapters.dart';

part 'cart_item_entity.g.dart';

@HiveType(typeId: 8)
class CartItemEntity extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final int counter;
  @HiveField(2)
  final CoffeeEntity coffee;
  CartItemEntity({this.id, required this.counter, required this.coffee});

  toJson() {
    return {'counter': counter, 'coffee': coffee.toJson()};
  }
}
