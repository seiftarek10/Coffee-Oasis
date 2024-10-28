import 'package:hive_flutter/adapters.dart';

part 'category_entity.g.dart';

@HiveType(typeId: 0)
class CategoryEntity extends HiveObject {
  @HiveField(0)
   String? id;
  @HiveField(1)
   String? name;
  @HiveField(2)
   String? photo;
  @HiveField(3)
  CategoryEntity({
    this.id,
    this.name,
    this.photo,
  });

  toJson() {
    return {
      'name': name,
      'photo': photo,
    };
  }
}
