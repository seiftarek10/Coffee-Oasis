import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/arrow_back.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key, required this.headerText,  this.titleColor,  this.iconColor,  this.borderIconColor});

  final String headerText;
  final Color? titleColor, iconColor, borderIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       const ArrowBackIcon(),
        Expanded(
            child: Text(headerText,
                textAlign: TextAlign.center,
                style: Fonts.font35_700White.copyWith(color: titleColor??Colors.white))),
        SizedBox(
          width: 20.w,
        )
      ],
    );
  }
}
