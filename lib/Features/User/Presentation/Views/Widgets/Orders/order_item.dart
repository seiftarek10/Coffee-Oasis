import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.kWhiteObacity,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  Assets.imagesTest,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text('Coffee Name',
                    style: Fonts.font18_700,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text('Category',
                    style: Fonts.font16_300,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
              ],
            ),
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
