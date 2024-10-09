import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCoffeeDrinkItem extends StatelessWidget {
  const HomeCoffeeDrinkItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: AspectRatio(
                  aspectRatio: 140 / 100,
                  child: Image.asset(Assets.imagesCoffee,
                      fit: BoxFit.fill))),
          SizedBox(height: 5.h),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Flat White', style: Fonts.font18_700),
                    const SizedBox(height: 4),
                    Text('Espresso',
                        style: Fonts.font14_500
                            .copyWith(color: Colors.grey[600])),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$ 4.53', style: Fonts.font20_700),
                        IconButton(
                            onPressed: () {},
                            icon: Container(
                              
                              padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: AppColors.kPrimaryColor,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}