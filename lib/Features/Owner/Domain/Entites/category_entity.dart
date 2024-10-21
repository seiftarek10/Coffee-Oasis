import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';

class CategoryEntity {
  final String? id;
  final String? name;
  final String? photo;
  final List<CoffeeEntity>? coffeeDrinks;

  CategoryEntity(
      { this.id,
       this.name,
       this.photo,
       this.coffeeDrinks});

  toJson() {
    return {
      'name': name,
      'photo':photo
    };
  }
}
