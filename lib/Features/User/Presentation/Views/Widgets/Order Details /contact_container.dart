import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Constant/value_constant.dart';
import 'package:flutter/material.dart';

class UserContactContainer extends StatelessWidget {
  const UserContactContainer({
    super.key,
    required this.userinfo,
  });

  final UserEntity userinfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.kWhiteObacity,
          borderRadius: BorderRadius.circular(AppConstant.kBorderRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userinfo.userName ?? 'No User Name', style: Fonts.font20_700),
          const SizedBox(height: 6),
          Text(userinfo.address ?? 'No Address', style: Fonts.font16_500),
          const SizedBox(height: 10),
          Row(children: [
            const Icon(Icons.phone),
            Text(' ${userinfo.phoneNumber}', style: Fonts.font16_500)
          ])
        ],
      ),
    );
  }
}
