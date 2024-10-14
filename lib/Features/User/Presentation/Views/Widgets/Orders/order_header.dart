
import 'package:coffee_oasis/Core/Widgets/rich_header_text.dart';
import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {
  const OrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const RichHeaderText(title: 'My Orders', subTitle: [
      'Stay refreshed with ',
      'Coffee Oasis ',
      'as you effortlessly track your ',
      'current coffee orders'
    ]);
  }
}
