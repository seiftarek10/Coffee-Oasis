import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderOrderCotainer extends StatelessWidget {
  const HeaderOrderCotainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Row(children: [
        const Expanded(
            flex: 2,
            child: AppClipReact(
                radiusForAll: true, child: CoffeePhotoCard(aspectRatio: 1))),
        const SizedBox(width: 16),
        const Expanded(flex: 7, child: TitleAndSubTitleCaffeeCard()),
        Text('1', style: Fonts.font18_700)
      ]),
    );
  }
}
