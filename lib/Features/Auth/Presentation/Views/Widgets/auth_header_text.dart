import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key, required this.title, required this.subTitle,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Fonts.font40_700White),
        Text(subTitle,
            style: Fonts.font20_700.copyWith(color: Colors.white)),
      ],
    );
  }
}
