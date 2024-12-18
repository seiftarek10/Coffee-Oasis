import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final String? coffeeId;
  final String? coffeeName;
  final String? categoryPhoto;

  CategoryModel({this.coffeeName, this.categoryPhoto, this.coffeeId})
      : super(id: coffeeId, name: coffeeName, photo: categoryPhoto);

  factory CategoryModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    return CategoryModel(
      coffeeId: json.id,
      categoryPhoto: json.data()!['photo'],
      coffeeName: json.data()!['name'],
    );
  }
}
