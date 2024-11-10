import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class CartHeaderPage extends StatelessWidget {
  const CartHeaderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Cart', style: Fonts.font40_700White),
        RichText(
            text: TextSpan(
                text: 'Review your cart and choose between ',
                style: Fonts.font18_700,
                children: [
              TextSpan(
                  text: 'Pick Up ',
                  style: Fonts.font18_700.copyWith(
                      color: AppColors.kDarkerPrimaryColor,
                      fontWeight: FontWeight.bold)),
              const TextSpan(text: 'Or '),
              TextSpan(
                  text: 'Delivery',
                  style: Fonts.font18_700.copyWith(
                      color: AppColors.kDarkerPrimaryColor,
                      fontWeight: FontWeight.bold)),
              const TextSpan(text: 'to complete your Order')
            ])),
      ],
    );
  }
}
