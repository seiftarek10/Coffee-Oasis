import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class CoffeePhotoCard extends StatelessWidget {
  const CoffeePhotoCard({
    super.key, required this.aspectRatio,
  });

  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.asset(
        Assets.imagesBackground,
        fit: BoxFit.fill,
      ),
    );
  }
}
