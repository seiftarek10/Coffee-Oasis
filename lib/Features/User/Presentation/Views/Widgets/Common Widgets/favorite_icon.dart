import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon(
      {super.key, required this.isFavorite, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          isFavorite ? Assets.imagesFillHeart : Assets.imagesHeart,
          height: 25.h,
          fit: BoxFit.cover,
        ));
  }

  final bool isFavorite;
  final void Function() onPressed;
}
