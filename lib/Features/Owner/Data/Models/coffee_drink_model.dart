import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';

class CoffeeDrinkModel extends CoffeeEntity {
  final String? coffeeId;
  final String? coffeeName;
  final String? coffeephoto;
  final String? coffeeprice;
  final String? coffeedescription;
  final String? categoryID;

  CoffeeDrinkModel(this.coffeeId, this.coffeedescription, this.coffeeName,
      this.coffeephoto, this.coffeeprice,this.categoryID)
      : super(
            description: coffeedescription ?? "",
            id: coffeeId,
            name: coffeeName ?? '',
            photo: coffeephoto ?? '',
            price: coffeeprice ?? '',
            categoryId: categoryID ??''
            );
  factory CoffeeDrinkModel.fromjson(
      QueryDocumentSnapshot<Map<String, dynamic>> json,String id) {
    return CoffeeDrinkModel(
        json.id,
        json.data()['description'],
        json.data()['name'],
        json.data()['photo'],
        json.data()['price'],
        id
        );
  }
}
