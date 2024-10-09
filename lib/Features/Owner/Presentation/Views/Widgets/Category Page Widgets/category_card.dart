import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppConstant.kBorderRadius),
      child: GridTile(
        footer: Container(
          color: Colors.white,
          height: 30.h,
          child: Center(
              child: Text(
            'Lattee',
            style: Fonts.font16_500,
          )),
        ),
        child: const Image(image: AssetImage(Assets.imagesTest),fit: BoxFit.fill,),
      ),
    );
  }
}