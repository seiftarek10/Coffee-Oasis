import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';


import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeDrinkItem extends StatelessWidget {
  const CoffeeDrinkItem({super.key, 

  });


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
              child: CoffeePhotoCard(aspectRatio: 0.5.h),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Coffee Title',
                    style: Fonts.font20_700,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'A brief description about Coffee.',
                    style: Fonts.font16_500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    r'Price: 70 $',
                    style: Fonts.font14_500PrimaryColor,
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

