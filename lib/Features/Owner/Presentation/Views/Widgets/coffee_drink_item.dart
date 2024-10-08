
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeDrinkItem extends StatelessWidget {
  const CoffeeDrinkItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        child: Card(
          color: AppColors.kWhiteObacity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 75.w,
                child: AspectRatio(
                  aspectRatio: 0.71,
                  child: Image.asset(
                    Assets.imagesCoffee,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Coffee Title', style: Fonts.font20_700),
                      Text(
                        'A brief description about the Coffee.',
                        style: Fonts.font14_500,
                      ),
                      Text(
                        r'Price: 70 $',
                        style: Fonts.font14_500PrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}