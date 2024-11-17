import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderOrderCotainer extends StatelessWidget {
  const HeaderOrderCotainer({
    super.key,
    required this.orderCoffeeInfo,
    required this.counter,
  });
  final CoffeeEntity orderCoffeeInfo;
  final int counter;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Row(children: [
        Expanded(
            flex: 3,
            child: AppClipReact(
                radiusForAll: true,
                child: CoffeePhotoCard(
                  aspectRatio: 1,
                  photo: orderCoffeeInfo.photo,
                ))),
        const SizedBox(width: 16),
        Expanded(
            flex: 7,
            child: TitleAndSubTitleCaffeeCard(
              title: orderCoffeeInfo.name ?? 'No Name',
              subTitle: orderCoffeeInfo.category ?? 'No Category',
            )),
        Text('$counter', style: Fonts.font18_700)
      ]),
    );
  }
}
