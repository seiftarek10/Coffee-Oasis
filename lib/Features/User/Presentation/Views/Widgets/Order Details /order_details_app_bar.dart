import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/arrow_back.dart';
import 'package:flutter/material.dart';

class OrderDetailsAppBar extends StatelessWidget {
  const OrderDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ArrowBackIcon(),
        const Spacer(),
        Text('Order Details', style: Fonts.font35_700White),
        const Spacer(),
        const SizedBox(width: 30),
      ],
    );
  }
}
