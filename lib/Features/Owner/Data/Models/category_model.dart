import 'package:coffee_oasis/Features/Owner/Data/Models/coffee_drink_model.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final String coffeeId;
  final String coffeeName;
  final String categoryPhoto;
  final List<CoffeeDrinkModel>? drinks;

  CategoryModel(this.coffeeId, this.coffeeName, this.categoryPhoto, this.drinks)
      : super(
            coffeeDrinks: drinks!,
            id: coffeeId,
            name: coffeeName,
            photo: categoryPhoto);
}
