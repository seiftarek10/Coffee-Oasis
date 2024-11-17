import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class TitleAndSubTitleCaffeeCard extends StatelessWidget {
  const TitleAndSubTitleCaffeeCard({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text(title,
            style: Fonts.font18_700,
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        Text(subTitle,
            style: Fonts.font16_300,
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        const SizedBox(height: 4),
      ],
    );
  }
}
