import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/constant.dart';
import 'package:flutter/material.dart';

class AppWhiteContainer extends StatelessWidget {
  const AppWhiteContainer({super.key, required this.child, this.padding, this.noPadding});

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool? noPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:noPadding==null?
          padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 15):EdgeInsets.zero,
      decoration: BoxDecoration(
          color: AppColors.kWhiteObacity,
          borderRadius: BorderRadius.circular(AppConstant.kBorderRadius)),
      child: child,
    );
  }
}
