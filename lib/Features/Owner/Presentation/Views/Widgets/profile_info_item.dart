import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem({
    super.key, required this.info, required this.title, required this.onPressed,
  });

  final String title, info;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Fonts.font20_700),
            Text(info, style: Fonts.font16_500),
          ],
        ),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.edit))
      ],
    );
  }
}
