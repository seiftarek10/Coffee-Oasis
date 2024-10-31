import 'package:hive_flutter/adapters.dart';

part 'coffee_entity.g.dart';

@HiveType(typeId: 1)
class CoffeeEntity extends HiveObject {
 
  @HiveType(typeId: 0)
  final String? id;
  @HiveType(typeId: 1)
  final String? photo;
  @HiveType(typeId: 2)
  final String? name;
  @HiveType(typeId: 3)
  final String? description;
  @HiveType(typeId: 4)
  final String? price;

  CoffeeEntity({this.id, this.photo, this.name, this.description, this.price});

  toJson() {
    return {
      'photo': photo,
      'name': name,
      'description': description,
      'price': price,
    };
  }
  
}
