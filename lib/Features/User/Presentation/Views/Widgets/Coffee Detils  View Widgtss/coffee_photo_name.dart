
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/constant.dart';
import 'package:flutter/material.dart';

class CoffeePhotoAndName extends StatelessWidget {
  const CoffeePhotoAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
         borderRadius: BorderRadius.circular(AppConstant.kBorderRadius),
          child: AspectRatio(
           aspectRatio: 327/202,
           child: Image.asset(Assets.imagesBackground,fit: BoxFit.cover)),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Coffee Name',style: Fonts.font24_700),
                 Text('Hot/Ice',style: Fonts.font16_300),
               ],
             ),
             Image.asset(Assets.imagesSuperiority,scale: 0.95,)
           ],
          ),
        ),
      ],
    );
  }
}