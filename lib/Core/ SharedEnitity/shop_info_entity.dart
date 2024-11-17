import 'package:hive_flutter/adapters.dart';

part 'shop_info_entity.g.dart';

@HiveType(typeId: 2)
class ShopInfoEntity extends HiveObject {
  @HiveField(0)
  final String? phoneNumber;
  @HiveField(1)
  final String? location;
  @HiveField(2)
  final String? startTime;
  @HiveField(3)
  final String? endTime;

  ShopInfoEntity(
      {this.phoneNumber, this.location, this.startTime, this.endTime});
}
