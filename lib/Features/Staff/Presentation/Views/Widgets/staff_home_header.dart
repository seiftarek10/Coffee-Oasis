import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffHomeHeader extends StatelessWidget {
  const StaffHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Orders',
                style: Fonts.font40_700White,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Manage Coffee Oasis ',
                      style: Fonts.font16_300.copyWith(color: Colors.white),
                      children: [
                    TextSpan(
                        text: 'orders ',
                        style: Fonts.font16_300
                            .copyWith(color: AppColors.kDarkerPrimaryColor)),
                    TextSpan(
                        text: 'with real-time updates for ',
                        style: Fonts.font16_300.copyWith(color: Colors.white)),
                    TextSpan(
                      text: 'smooth service',
                      style: Fonts.font16_300
                          .copyWith(color: AppColors.kDarkerPrimaryColor),
                    ),
                  ]))
            ],
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.search, color: Colors.white, size: 32.h))
      ],
    );
  }
}
