import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/constant.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/profile_info_item.dart';
import 'package:flutter/material.dart';

class ShopInfoContainer extends StatelessWidget {
  const ShopInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shop Info', style: Fonts.font35_700White),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
              color: AppColors.kWhiteObacity,
              borderRadius: BorderRadius.circular(AppConstant.kBorderRadius)),
          child: Column(
            children: [
              ProfileInfoItem(
                title: 'Email',
                info: 'Seift470@gmail.com',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileInfoItem(
                title: 'phone',
                info: '01027870171',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileInfoItem(
                title: 'Location',
                info: 'Giza',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              ProfileInfoItem(
                title: 'Work Time',
                info: 'From 10 AM To 11 PM',
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}