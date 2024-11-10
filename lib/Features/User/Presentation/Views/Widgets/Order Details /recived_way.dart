import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetatilsRecivedWay extends StatelessWidget {
  const OrderDetatilsRecivedWay({super.key, required this.isDeliverd});
  final bool isDeliverd;
  @override
  Widget build(BuildContext context) {
    return isDeliverd
        ? Row(
            children: [
              _buildContainer('Deliver', true, true),
              _buildContainer('Pickup', false, false),
            ],
          )
        : Row(
            children: [
              _buildContainer('Deliver', true, false),
              _buildContainer('Pickup', false, true),
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
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
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
