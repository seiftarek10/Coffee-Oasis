import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsViewBottomBar extends StatelessWidget {
  const DetailsViewBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, -0.7),
            blurRadius: 1,
            color: Color.fromARGB(255, 241, 241, 241),
            blurStyle: BlurStyle.inner,
            spreadRadius: 2)
      ]),
      height: 90.h,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Price', style: Fonts.font16_500),
                Text(r'$ 4.53',
                    style: Fonts.font18_700
                        .copyWith(color: AppColors.kPrimaryColor)),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: AppButton(
                title: 'Order Now',
                verticalPadding: 12.h,
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
