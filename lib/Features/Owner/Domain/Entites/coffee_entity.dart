class CoffeeEntity {
  final String id;
  final String photo;
  final String name;
  final String description;
  final String price;

  CoffeeEntity(
      {required this.id,
      required this.photo,
      required this.name,
      required this.description,
      required this.price});

  toJson() {
    return {
      'photo': photo,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
