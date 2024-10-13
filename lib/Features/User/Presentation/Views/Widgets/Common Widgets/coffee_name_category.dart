
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class CoffeeNameAndCategory extends StatelessWidget {
  const CoffeeNameAndCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text('Coffee Name',
            style: Fonts.font18_700,
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        Text('Category',
            style: Fonts.font16_300,
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        const SizedBox(height: 4),
      ],
    );
  }
}
