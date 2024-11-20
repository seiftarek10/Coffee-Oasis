import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffOrderDetailsButton extends StatelessWidget {
  const StaffOrderDetailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: AppButton(
          squareShape: true,
          onPressed: (trigger) async {},
          title: 'Submit',
          radius: 20,
          titleColor: Colors.white,
          backgroundColor: AppColors.kPrimaryColor),
    );
  }
}
