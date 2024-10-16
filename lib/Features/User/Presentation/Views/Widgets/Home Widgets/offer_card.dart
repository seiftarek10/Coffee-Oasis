import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 150.h, 
      left: 18,
      right: 18,
      child: Image.asset(
        Assets.imagesOffer,
        fit: BoxFit.fill,
      ),
    );
  }
}
