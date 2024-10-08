import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.titleColor,
    required this.backgroundColor,
    required this.title,
    required this.onPresed,
  });

  final Color titleColor, backgroundColor;
  final String title;
  final void Function() onPresed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          overlayColor: AppColors.kPrimaryColor,
            padding: const EdgeInsets.symmetric(vertical: 10),
            backgroundColor: backgroundColor),
        onPressed: onPresed,
        
        child:
            Text(title, style: Fonts.font20_700.copyWith(color: titleColor)));
  }
}