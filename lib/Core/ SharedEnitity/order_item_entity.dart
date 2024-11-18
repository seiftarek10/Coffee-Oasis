import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:hive_flutter/adapters.dart';

part 'order_item_entity.g.dart';

@HiveType(typeId: 8)
class OrderItemEntity extends HiveObject {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  int counter;
  @HiveField(2)
  final CoffeeEntity coffee;
  @HiveField(3)
  bool? isDelivery;
  @HiveField(4)
  bool? isFinished;
  @HiveField(5)
  num? price;

  OrderItemEntity({
    this.id,
    required this.counter,
    required this.price,
    required this.coffee,
    this.isDelivery,
    this.isFinished,
  });

  toCartJson() {
    return {
      'counter': counter,
      'price': price,
      'coffee': coffee.toJson(),
    };
  }

  toOrderJson() {
    return {
      'counter': counter,
      'price': price,
      'coffee': coffee.toJson(),
      'isDelivery': isDelivery,
      'isFinished': isFinished,
    };
  }
}
