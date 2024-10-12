import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Common%20Widgets/coffee_name_category.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.kWhiteObacity,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          const Expanded(
            flex: 3,
            child: AppClipReact(
            radiusForAll: false,
              child: CoffeePhotoCard(aspectRatio: 1)
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            flex: 7,
            child: CoffeeNameAndCategory()
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
