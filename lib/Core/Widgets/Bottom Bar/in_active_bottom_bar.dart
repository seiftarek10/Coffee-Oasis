import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:flutter/material.dart';

class InActiveBottomBarItem extends StatelessWidget {
  const InActiveBottomBarItem({
    super.key, required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 40,
      color: AppColors.kLightPrimaryColor,
    );
  }
}
