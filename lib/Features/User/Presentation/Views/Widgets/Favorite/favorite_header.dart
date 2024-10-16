import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/arrow_back.dart';
import 'package:flutter/material.dart';

class FavoriteHeader extends StatelessWidget {
  const FavoriteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ArrowBackIcon(),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Favorites', style: Fonts.font35_700White),
              RichText(
                  text: TextSpan(
                      text: 'Your curated selection of ',
                      style: Fonts.font18_700,
                      children: [
                    TextSpan(
                        text: '  coffee delights ',
                        style: Fonts.font18_700.copyWith(
                            color: AppColors.kDarkerPrimaryColor,
                            fontWeight: FontWeight.bold)),
                  ])),
            ],
          ),
        ),
      ],
    );
  }
}
