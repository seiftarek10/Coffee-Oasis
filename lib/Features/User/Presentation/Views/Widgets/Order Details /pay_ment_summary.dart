import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({
    super.key,
  });

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
            Text('Price', style: Fonts.font16_500),
            Text(r'$ 5,43', style: Fonts.font18_700),
          ],
        ),
        Space.k8,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Deliver', style: Fonts.font16_500),
            Text(r'$ 3,43', style: Fonts.font18_700),
          ],
        ),
      ],
    );
  }
}
