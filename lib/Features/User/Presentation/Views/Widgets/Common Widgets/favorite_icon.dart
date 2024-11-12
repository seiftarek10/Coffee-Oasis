import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({
    super.key,
    required this.isFavorite,
    required this.onPressed,
    this.isLoading,
  });

  final bool isFavorite;
  final void Function() onPressed;
  final bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: isLoading == true
          ? SizedBox(
              height: 25.h,
              width: 25.h,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            )
          : SvgPicture.asset(
              isFavorite ? Assets.imagesFillHeart : Assets.imagesHeart,
              height: 25.h,
              fit: BoxFit.cover,
            ),
    );
  }
}
