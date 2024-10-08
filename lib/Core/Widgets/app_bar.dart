import 'package:coffee_oasis/Core/Theme/fonts.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key, required this.headerText,  this.titleColor,  this.iconColor,  this.borderIconColor});

  final String headerText;
  final Color? titleColor, iconColor, borderIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Container(
              padding: const EdgeInsetsDirectional.all(7),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: borderIconColor??Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child:  Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
                color: iconColor??Colors.white,
              ),
            )),
        // SizedBox(width: 80.w),
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
