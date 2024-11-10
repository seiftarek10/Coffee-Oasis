import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    super.key,
    required this.price,
    required this.counter,
  });

  final String price;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: Fonts.font18_700,
        ),
        Space.k12,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Price for Item', style: Fonts.font16_500),
            Text(r'$ ' '${int.parse(price) / counter}',
                style: Fonts.font18_700),
          ],
        ),
        Space.k8,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Price', style: Fonts.font16_500),
            Text(r'$ ' '${double.parse(price)}', style: Fonts.font18_700),
          ],
        ),
      ],
    );
  }
}
