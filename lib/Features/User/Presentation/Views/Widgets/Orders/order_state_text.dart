import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class OrderStateText extends StatelessWidget {
  const OrderStateText({
    super.key,
    required this.isFinished,
    required this.isDelivered,
  });

  final bool isFinished;
  final bool isDelivered;

  @override
  Widget build(BuildContext context) {
    return Text(
      isFinished
          ? isDelivered
              ? 'OnTheWay'
              : 'Finished'
          : 'Preparing',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Fonts.font16_500.copyWith(
          color: isFinished ? Colors.green : AppColors.kDarkerPrimaryColor),
    );
  }
}
