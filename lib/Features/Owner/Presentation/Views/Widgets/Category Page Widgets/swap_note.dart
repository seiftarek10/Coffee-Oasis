import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class SwapNote extends StatelessWidget {
  const SwapNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'Swipe left to ',
            style: Fonts.font18_700,
            children: [
          TextSpan(
              text: 'Delete ',
              style: Fonts.font18_700.copyWith(
                  color: AppColors.kDarkerPrimaryColor,
                  fontWeight: FontWeight.bold)),
          const TextSpan(text: 'and right to '),
          TextSpan(
              text: 'Edit',
              style: Fonts.font18_700.copyWith(
                  color: AppColors.kDarkerPrimaryColor,
                  fontWeight: FontWeight.bold)),
        ]));
  }
}
