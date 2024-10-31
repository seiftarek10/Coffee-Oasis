import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';

class CoffeeDrinkModel extends CoffeeEntity {
  final String? coffeeId;
  final String? coffeeName;
  final String? coffeephoto;
  final String? coffeeprice;
  final String? coffeedescription;

  CoffeeDrinkModel(this.coffeeId, this.coffeedescription, this.coffeeName,
      this.coffeephoto, this.coffeeprice)
      : super(
          description: coffeedescription ?? "",
          id: coffeeId,
          name: coffeeName ?? '',
          photo: coffeephoto ?? '',
          price: coffeeprice ?? '',
        );
  factory CoffeeDrinkModel.fromjson(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return CoffeeDrinkModel(
      json.id,
      json.data()['description'],
      json.data()['name'],
      json.data()['photo'],
      json.data()['price'],
    );
  }
}
