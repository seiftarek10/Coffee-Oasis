import 'package:hive_flutter/adapters.dart';

part 'coffee_entity.g.dart';

@HiveType(typeId: 1)
class CoffeeEntity extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? photo;

  @HiveField(2)
  final String? name;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final num? price;

  @HiveField(5)
  final String? category;

  CoffeeEntity(
      {this.id,
      this.photo,
      this.name,
      this.description,
      this.price,
      this.category});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'photo': photo,
      'name': name,
      'description': description,
      'price': price,
      'category': category
    };
  }

  factory CoffeeEntity.fromJson(Map<String, dynamic> json) {
    return CoffeeEntity(
      id: json['id'],
      photo: json['photo'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      category: json['category'],
    );
  }
}
