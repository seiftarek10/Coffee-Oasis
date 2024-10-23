import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Features/Owner/Data/Models/coffee_drink_model.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final String? coffeeId;
  final String? coffeeName;
  final String? categoryPhoto;
  final List<CoffeeDrinkModel>? drinks;

  CategoryModel(
      {this.coffeeName, this.categoryPhoto, this.drinks, this.coffeeId})
      : super(
            id: coffeeId,
            coffeeDrinks: drinks!,
            name: coffeeName,
            photo: categoryPhoto);

  factory CategoryModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return CategoryModel(
      coffeeId: json.id,
      categoryPhoto: json.data()['photo'],
      coffeeName: json.data()['name'],
      drinks: []
    );
  }
}
