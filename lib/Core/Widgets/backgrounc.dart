import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(Assets.imagesBackground), fit: BoxFit.fill)),
            
          );
  }
}