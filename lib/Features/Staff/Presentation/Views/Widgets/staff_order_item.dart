import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:flutter/material.dart';

class StaffOrderItem extends StatelessWidget {
  const StaffOrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.kWhiteObacity,
          borderRadius: BorderRadius.circular(15)),
      child: Row(children: [
        const Expanded(
            flex: 2,
            child: AppClipReact(
                radiusForAll: false, child: CoffeePhotoCard(aspectRatio: 1))),
        const SizedBox(width: 16),
        const Expanded(flex: 7, child: TitleAndSubTitleCaffeeCard()),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text('1', style: Fonts.font18_700),
        )
      ]),
    );
  }
}
