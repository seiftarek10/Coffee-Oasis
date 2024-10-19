import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';

class CoffeeDrinkModel extends CoffeeEntity {
  final String coffeeId;
  final String? coffeeName;
  final String? coffeephoto;
  final String? coffeeprice;
  final String? coffeedescription;

  CoffeeDrinkModel(
      this.coffeeId,
      this.coffeedescription,
      this.coffeeName,
      this.coffeephoto,
      this.coffeeprice)
      : super(
            description: coffeedescription ?? "",
            id: coffeeId,
            name: coffeeName ?? '',
            photo: coffeephoto ?? '',
            price: coffeeprice ?? '');
}
