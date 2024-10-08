
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoffeeDtrinkPhoto extends StatelessWidget {
  const CoffeeDtrinkPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage(Assets.imagesCoffee)),
          shape: BoxShape.circle),
      child: Align(
          alignment: Alignment(0.3.w, 1),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_a_photo,
                  color: AppColors.kPrimaryColor, size: 40))),
    );
  }
}