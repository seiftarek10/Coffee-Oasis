import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final List<String> subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title, style: Fonts.font40_700White),
      RichText(
          text: TextSpan(
              text: subTitle[0],
              style: Fonts.font20_700.copyWith(color: Colors.white),
              children: [
            TextSpan(
                text: subTitle[1],
                style:
                    Fonts.font20_700.copyWith(color: AppColors.kPrimaryColor),
                children: [
                  TextSpan(
                    text: subTitle[2],
                    style: Fonts.font20_700.copyWith(color: Colors.white),
                  )
                ])
          ]))
    ]);
  }
}
