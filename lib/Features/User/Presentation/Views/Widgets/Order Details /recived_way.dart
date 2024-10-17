import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetatilsRecivedWay extends StatelessWidget {
  const OrderDetatilsRecivedWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildContainer('Deliver', true, true),
        _buildContainer('Pickup', false, false),
      ],
    );
  }

  Widget _buildContainer(String text, bool isLeft, bool isSelected) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.kPrimaryColor : AppColors.kWhiteObacity,
          borderRadius: isLeft
              ? const BorderRadius.only(
                  topLeft: Radius.circular(AppConstant.kBorderRadius),
                  bottomLeft: Radius.circular(AppConstant.kBorderRadius),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(AppConstant.kBorderRadius),
                  bottomRight: Radius.circular(AppConstant.kBorderRadius),
                ),
        ),
        child: Text(
          text,
          style: Fonts.font20_700
              .copyWith(color: isSelected ? Colors.white : Colors.grey[500]),
        ),
      ),
    );
  }
}
