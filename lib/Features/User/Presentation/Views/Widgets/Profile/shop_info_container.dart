import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';

import 'package:coffee_oasis/Core/Widgets/Profile/profile_info_item.dart';
import 'package:flutter/material.dart';

class UserShopInfoContainer extends StatelessWidget {
  const UserShopInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Shop Info', style: Fonts.font35_700White),
      const SizedBox(height: 10),
      AppWhiteContainer(
          child: Column(children: [
        const ProfileInfoItem(
            info: '01027870171', title: 'Phone', needIcon: false),
        Space.k20,
        const ProfileInfoItem(info: 'Maadi', title: 'Address', needIcon: false),
        Space.k20,
        const ProfileInfoItem(
            info: 'Work Time', title: 'From 10 To 12 Pm ', needIcon: false),
      ]))
    ]);
  }
}
