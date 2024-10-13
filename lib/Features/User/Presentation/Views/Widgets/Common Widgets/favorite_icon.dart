import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon(
      {super.key, required this.isClicked, required this.clicked});

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
  final bool isClicked;
  final ValueChanged<bool> clicked;
}

class _FavoriteIconState extends State<FavoriteIcon> {
  late bool _isFavorite;

  @override
  void initState() {
    _isFavorite = widget.isClicked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            _isFavorite = !_isFavorite;
            widget.clicked(_isFavorite);
          });
        },
        icon: SvgPicture.asset(
          _isFavorite ? Assets.imagesFillHeart : Assets.imagesHeart,
          height: 25.h,
          fit: BoxFit.cover,
        ));
  }
}
