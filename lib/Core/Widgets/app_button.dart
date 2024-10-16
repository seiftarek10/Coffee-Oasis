import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/constant.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    required this.verticalPadding,
    required this.onPressed, this.backgroundColor,
  });

  final String title;
  final double verticalPadding;
  final void Function() onPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstant.kBorderRadius)),
            padding: EdgeInsets.symmetric(vertical: verticalPadding),
            backgroundColor: backgroundColor?? AppColors.kPrimaryColor),
        onPressed: onPressed,
        child: Text(
          title,
          style: Fonts.font20_700.copyWith(color: Colors.white),
        ));
  }
}
