import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:hive_flutter/adapters.dart';

part 'order_entity.g.dart';

@HiveType(typeId: 8)
class OrderEntity extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final int counter;
  @HiveField(2)
  final CoffeeEntity coffee;
  OrderEntity({this.id, required this.counter, required this.coffee});

  toJson() {
    return {'counter': counter, 'coffee': coffee.toJson()};
  }
}
