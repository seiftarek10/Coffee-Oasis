import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';

import 'package:coffee_oasis/Core/Widgets/Profile/profile_info_item.dart';
import 'package:flutter/material.dart';

class UserShopInfoContainer extends StatelessWidget {
  const UserShopInfoContainer({
    super.key,
    required this.shopInfo,
  });

  final ShopInfoEntity shopInfo;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Shop Info', style: Fonts.font35_700White),
      const SizedBox(height: 10),
      AppWhiteContainer(
          child: Column(children: [
        ProfileInfoItem(
            info: shopInfo.phoneNumber ?? 'Un Avaliable',
            title: 'Phone',
            needIcon: false),
        Space.k20,
        ProfileInfoItem(
            info: shopInfo.location ?? 'Un Avaliable',
            title: 'Address',
            needIcon: false),
        Space.k20,
        ProfileInfoItem(
            info: 'From ${shopInfo.startTime} To ${shopInfo.endTime} Pm',
            title: 'Work Time',
            needIcon: false),
      ]))
    ]);
  }
}
