import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeaderContainer extends StatelessWidget {
  const ProfileHeaderContainer({
    super.key, required this.title, required this.subTitle,
  });

  final String title,subTitle;
  @override
  Widget build(BuildContext context) {
    return AppWhiteContainer(
      
        child: Row(
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundColor: AppColors.kPrimaryColor,
                backgroundImage: const AssetImage(Assets.imagesLogo),
                radius: 35.h,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Fonts.font18_700),
                  Text(subTitle, style: Fonts.font16_500),
                ],
              ),
            )
          ],
        ));
  }
}
