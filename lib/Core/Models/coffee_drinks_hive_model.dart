import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:hive_flutter/adapters.dart';

part 'coffee_drinks_hive_model.g.dart';

@HiveType(typeId: 3)
class CoffeeDrinksHiveModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final List<CoffeeEntity> coffeeDrinks;

  CoffeeDrinksHiveModel({required this.id, required this.coffeeDrinks});
}
