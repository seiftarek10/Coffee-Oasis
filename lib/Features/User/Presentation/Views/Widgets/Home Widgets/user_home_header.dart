import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/search_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserHomeHeader extends StatelessWidget {
  const UserHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215.h,
      color: const Color(0xff1d1d1d),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: Fonts.font16_500.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            'Luka Modrich',
            style: Fonts.font18_700.copyWith(color: AppColors.kWhiteObacity),
          ),
          Flexible(
            child: SizedBox(height: 20.h),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 5,
                child: SearchField(),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: AppClipReact(
                    radiusForAll: true,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: SvgPicture.asset(Assets.imagesFilet),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
