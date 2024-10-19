import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';

class CategoryEntity {
  final String id;
  final String name;
  final String photo;
  final List<CoffeeEntity> coffeeDrinks;

  CategoryEntity(
      {required this.id,
      required this.name,
      required this.photo,
      required this.coffeeDrinks});

  toJson() {
    return {
      'name': name,
      'photo': photo,
    };
  }
}
