import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TabBar(
        labelStyle: Fonts.font24_700.copyWith(color: AppColors.kDarkerPrimaryColor),
        unselectedLabelStyle:Fonts.font18_700.copyWith(color: Colors.white),
        dividerHeight: 0.0,
        indicator:  BoxDecoration(
          color: const Color.fromARGB(132, 0, 0, 0),
          borderRadius: BorderRadius.circular(10),
          
        ),
        indicatorSize:TabBarIndicatorSize.values[0],
        
        tabs: [
          Text('Pick Up', style: Fonts.font18_700),
          Text('Deliver', style: Fonts.font18_700),
        ],
      ),
    );
  }
}
