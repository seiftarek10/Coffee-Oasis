import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/arrow_back.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Common%20Widgets/favorite_icon.dart';
import 'package:flutter/material.dart';


class CoffeeDetailsAppBar extends StatelessWidget {
  const CoffeeDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: ArrowBackIcon()
        ),
        Expanded(
            flex: 7,
            child: Text('Details',
                textAlign: TextAlign.center, style: Fonts.font20_700)),
        Expanded(
            child: FavoriteIcon(
                isClicked: false,
                clicked: (isClicked) {
             
                }))
      ],
    );
  }
}
