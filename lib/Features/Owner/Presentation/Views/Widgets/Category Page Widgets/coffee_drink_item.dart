import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';

import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeDrinkItem extends StatelessWidget {
  const CoffeeDrinkItem({
    super.key, this.coffeeEntity,
  });

  final CoffeeEntity? coffeeEntity;

  @override
  Widget build(BuildContext context) {
    return AppClipReact(
      radiusForAll: true,
      child: Container(
        color: AppColors.kWhiteObacity,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CoffeePhotoCard(aspectRatio: 0.6.h,photo: coffeeEntity?.photo),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    coffeeEntity?.name??'No Name',
                    style: Fonts.font20_700,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    coffeeEntity?.description??'Coffee Drink',
                    style: Fonts.font16_500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                   'Price :${coffeeEntity?.price??'0'} ' r'$',
                    style: Fonts.font14_500PrimaryColor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
