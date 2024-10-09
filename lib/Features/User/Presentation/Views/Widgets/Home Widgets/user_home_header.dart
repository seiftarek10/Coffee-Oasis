import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/constant.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/search_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserHomeHeader extends StatelessWidget {
  const UserHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
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
            style: Fonts.font18_700.copyWith(color: Colors.white),
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
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppConstant.kBorderRadius),
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: SvgPicture.asset(Assets.imagesFiletr))),
              )
            ],
          )
        ],
      ),
    );
  }


}


