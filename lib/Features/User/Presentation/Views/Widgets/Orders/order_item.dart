import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/order_state_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AppWhiteContainer(
        noPadding: true,
        child: Row(children: [
           Expanded(
              flex: 3,
              child: AppClipReact(
                  radiusForAll: false,
                  child: CoffeePhotoCard(
                    aspectRatio: 0.5.h,
                  ))),
          const SizedBox(width: 16),
          const Expanded(
              flex: 7,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndSubTitleCaffeeCard(),
                    SizedBox(height: 4),
                    OrderStateText(
                      isFinished: false,
                      isDelivered: false,
                    ),
                  ])),
          Expanded(
              flex: 3,
              child: Text(
                r'$ 4.53',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Fonts.font18_700
                    .copyWith(color: AppColors.kDarkerPrimaryColor),
              ))
        ]));
  }
}


