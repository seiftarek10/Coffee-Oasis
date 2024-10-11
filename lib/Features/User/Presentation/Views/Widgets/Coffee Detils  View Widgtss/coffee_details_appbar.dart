import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CoffeeDetailsAppBar extends StatefulWidget {
  const CoffeeDetailsAppBar({
    super.key,
  });

  @override
  State<CoffeeDetailsAppBar> createState() => _CoffeeDetailsAppBarState();
}

class _CoffeeDetailsAppBarState extends State<CoffeeDetailsAppBar> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_rounded, size: 30)),
        ),
        Expanded(
            flex: 5,
            child: Text('Details',
                textAlign: TextAlign.center, style: Fonts.font20_700)),
        Expanded(
          child: IconButton(
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
              icon: SvgPicture.asset(_isFavorite?Assets.imagesFillHeart : Assets.imagesHeart, height: 25.h)),
        )
      ],
    );
  }
}
