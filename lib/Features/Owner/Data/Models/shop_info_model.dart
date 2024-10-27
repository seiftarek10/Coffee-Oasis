import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';

class ShopInfoModel extends ShopInfoEntity {
  final String? number;
  final String? shopLocation;
  final String? shopStartTime;
  final String? shopEndTime;

  ShopInfoModel(
      this.number, this.shopLocation, this.shopStartTime, this.shopEndTime)
      : super(
            phoneNumber: number,
            location: shopLocation,
            startTime: shopStartTime,
            endTime: shopEndTime);
  factory ShopInfoModel.fromJson(Map<String, dynamic>? json) {
    return ShopInfoModel(
        json?['phone'], json?['location'], json?['startTime'], json?['endTime']);
  }
}
