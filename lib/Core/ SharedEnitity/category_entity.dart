import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:hive_flutter/adapters.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 0)
class CategoryEntity extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? photo;
  @HiveField(3)
  List<CoffeeEntity>? coffeeDrinks;
  CategoryEntity({this.id, this.name, this.photo, this.coffeeDrinks});

  toJson() {
    return {
      'name': name,
      'photo': photo,
    };
  }
}
