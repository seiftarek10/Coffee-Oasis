import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AppWhiteContainer(
     noPadding: true,
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child: AppClipReact(
              radiusForAll: false,
              child: CoffeePhotoCard(
                aspectRatio: 1,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            flex: 7,
            child: TitleAndSubTitleCaffeeCard(),
          ),
          Expanded(
            flex: 3,
            child: Text(
              r'$ 4.53',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Fonts.font18_700
                  .copyWith(color: AppColors.kDarkerPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
