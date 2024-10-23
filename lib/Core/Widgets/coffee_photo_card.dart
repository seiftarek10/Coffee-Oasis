import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class CoffeePhotoCard extends StatelessWidget {
  const CoffeePhotoCard({
    super.key,
    required this.aspectRatio, this.photo,
  });

  final double aspectRatio;
  final String? photo;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: photo==null? Image.asset(
        Assets.imagesCoffeePlaceholder,
        fit: BoxFit.fill,
      ):Image.network(photo!,fit: BoxFit.fill,),
    );
  }
}
