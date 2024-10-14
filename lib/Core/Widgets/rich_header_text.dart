import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class RichHeaderText extends StatelessWidget {
  const RichHeaderText({
    super.key,
    required this.title,
    required this.subTitle, this.smallTitle,
  });

  final String title;
  final List<String> subTitle;
  final bool? smallTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: smallTitle!=null? Fonts.font35_700White:Fonts.font40_700White,
        ),
        RichText(
            text: TextSpan(
                text: subTitle[0],
                style: Fonts.font16_500.copyWith(color: Colors.white),
                children: [
              TextSpan(
                  text: subTitle[1],
                  style: Fonts.font16_500
                      .copyWith(color: AppColors.kDarkerPrimaryColor)),
              TextSpan(
                  text: subTitle[2],
                  style: Fonts.font16_500.copyWith(color: Colors.white)),
              TextSpan(
                text: subTitle[3],
                style: Fonts.font16_500
                    .copyWith(color: AppColors.kDarkerPrimaryColor),
              ),
            ]))
      ],
    );
  }
}
