
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Detils%20%20View%20Widgtss/read_more_widget.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: Fonts.font20_700),
        const SizedBox(height: 8),
        const ReadMoreText(
          text:  'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.',
          maxLines: 3,
          
        ),
      ],
    );
  }
}
