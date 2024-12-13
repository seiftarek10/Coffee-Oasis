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
  @HiveField(6)
  String? date;
  @HiveField(7)
  bool? isPaid;

  OrderItemEntity(
      {this.id,
      required this.counter,
      required this.price,
      required this.coffee,
      this.isDelivery,
      this.isFinished,
      this.date,
      this.isPaid});

  toCartJson() {
    return {
      'counter': counter,
      'price': price,
      'coffee': coffee.toJson(),
    };
  }

  toOrderJson({required String date}) {
    return {
      'counter': counter,
      'price': price,
      'coffee': coffee.toJson(),
      'isDelivery': isDelivery ?? true,
      'isFinished': isFinished,
      'Date': date,
      'isPaid': isPaid ?? false
    };
  }
}
