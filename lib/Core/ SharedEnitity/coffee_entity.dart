import 'package:hive_flutter/adapters.dart';

part 'coffee_entity.g.dart';

@HiveType(typeId: 1) // Set a unique typeId for CoffeeEntity
class CoffeeEntity extends HiveObject {
  @HiveField(0) // Use @HiveField with unique indices for each field
  final String? id;

  @HiveField(1)
  final String? photo;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String? price;

  CoffeeEntity({this.id, this.photo, this.name, this.description, this.price});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photo': photo,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
