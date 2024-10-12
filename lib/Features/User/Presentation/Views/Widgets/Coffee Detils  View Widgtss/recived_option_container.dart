import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/constant.dart';
import 'package:flutter/material.dart';

class RecivingOptionContainer extends StatelessWidget {
  const RecivingOptionContainer({
    super.key,
    required this.isSelected, required this.index,
  });

  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index==0?  const EdgeInsets.only(right: 8):const EdgeInsets.only(left: 8),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
            color: isSelected ? const Color(0xfff9f2ed) : null,
            borderRadius: BorderRadius.circular(AppConstant.kBorderRadius),
            shape: BoxShape.rectangle,
            border: Border.all(
                width: isSelected ? 2 : 0.5,
                color: isSelected ? AppColors.kPrimaryColor : Colors.grey)),
        child: Text(
          
          index==0?'Deliver':'Pick Up',
            style: Fonts.font18_700
                .copyWith(color: isSelected ? AppColors.kPrimaryColor : null)),
      ),
    );
  }
}
