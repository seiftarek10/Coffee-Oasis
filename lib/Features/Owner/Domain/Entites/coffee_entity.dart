class CoffeeEntity {
  final String? id;
  final String? photo;
  final String? name;
  final String? description;
  final String? price;

  CoffeeEntity(
      { this.id,
       this.photo,
       this.name,
       this.description,
       this.price});

  toJson() {
    return {
      'photo': photo,
      'name': name,
      'description': description,
      'price': price,
    };
  }
}
