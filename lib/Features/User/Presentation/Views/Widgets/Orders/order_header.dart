import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {
  const OrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Orders', style: Fonts.font40_700White),
            
        RichText(
            text: TextSpan(
                text: 'Stay refreshed with ',
                style: Fonts.font18_700,
                children: [
              TextSpan(
                  text: 'Coffee Oasis ',
                  style: Fonts.font18_700.copyWith(
                      color: AppColors.kDarkerPrimaryColor,
                      fontWeight: FontWeight.bold)),
              const TextSpan(text: 'as you effortlessly track your '),
              TextSpan(
                  text: 'current coffee orders',
                  style: Fonts.font18_700.copyWith(
                      color:  AppColors.kDarkerPrimaryColor,
                      fontWeight: FontWeight.bold)),
              
            ])),
       
      ],
    );
  }
}