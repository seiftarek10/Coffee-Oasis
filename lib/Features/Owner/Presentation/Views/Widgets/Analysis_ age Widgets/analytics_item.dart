import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalyticsContainerItem extends StatelessWidget {
  const AnalyticsContainerItem({
    super.key,
    required this.info,
    required this.title,
  });

  final String title, info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Fonts.font18_700),
            Text(info, style: Fonts.font16_500),
          ],
        ),
        Divider(thickness: 2, height: 15.h),
      ],
    );
  }
}
