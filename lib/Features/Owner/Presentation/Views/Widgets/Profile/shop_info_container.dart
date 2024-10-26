import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';

import 'package:coffee_oasis/Core/Widgets/Profile/edit_profile_field.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/edit_work_time_body.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_info_item.dart';
import 'package:flutter/material.dart';

class ShopInfoContainer extends StatelessWidget {
  const ShopInfoContainer({
    super.key,
    required this.shopInfoEntity, this.showTextTitle,
  });

  final ShopInfoEntity shopInfoEntity;
  final bool? showTextTitle;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      showTextTitle==null?  Text('Shop Info', style: Fonts.font35_700White):const SizedBox.shrink(),
      const SizedBox(height: 10),
      AppWhiteContainer(
          child: Column(children: [
        ProfileInfoItem(
            title: 'phone',
            info: shopInfoEntity.phoneNumber ?? '00',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return EditFieldBody(
                      labelText: shopInfoEntity.phoneNumber ?? '',
                      keyboardType: TextInputType.number,
                      onSaved: (v) {},
                    );
                  });
            }),
        const SizedBox(height: 20),
        ProfileInfoItem(
            title: 'Location',
            info: shopInfoEntity.location ?? '',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return EditFieldBody(
                      labelText: 'Giza',
                      onSaved: (v) {},
                    );
                  });
            }),
        const SizedBox(height: 20),
        ProfileInfoItem(
            title: 'Work Time',
            info:
                'From ${shopInfoEntity.startTime} To ${shopInfoEntity.endTime}',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return const EditWorkTimeBody(
                      startTime: 'From 10 AM ',
                      endTime: 'To 11 PM',
                    );
                  });
            })
      ]))
    ]);
  }
}
