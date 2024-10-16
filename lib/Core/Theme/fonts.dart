import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Fonts {
  static TextStyle font16_500 =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500);

  static TextStyle font18_700 =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700);
  static TextStyle font20_700 =
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700);
    static TextStyle font24_700 =
      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700,color: Colors.black);
  
  static TextStyle font16_300 =
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w300);

  static TextStyle font40_700White = TextStyle(
      fontSize: 40.sp, fontWeight: FontWeight.w700, color: Colors.white);

  static TextStyle font35_700White = const TextStyle(
      fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700);

  static TextStyle font14_500PrimaryColor = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.kPrimaryColor);
  
  static TextStyle font14_500 = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      );
}
