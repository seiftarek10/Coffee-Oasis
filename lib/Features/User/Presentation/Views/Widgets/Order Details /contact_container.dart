import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Constant/value_constant.dart';
import 'package:flutter/material.dart';

class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
  });

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
          Text('Alexendria', style: Fonts.font20_700),
          const SizedBox(height: 6),
          Text('Khaled Abn El Waled', style: Fonts.font16_500),
          const SizedBox(height: 10),
          Row(children: [
            const Icon(Icons.phone),
            Text(' 01027870171', style: Fonts.font16_500)
          ])
        ],
      ),
    );
  }
}
