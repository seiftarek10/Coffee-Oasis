import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem({
    super.key,
    required this.info,
    required this.title,
    this.onPressed, this.editItem,
  });

  final String title, info;
  final void Function()? onPressed;
  final bool? editItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Fonts.font20_700),
           editItem==null?  Text(info, style: Fonts.font16_500):const SizedBox.shrink(),
          ],
        ),
        IconButton(onPressed: onPressed, icon:  Icon(editItem==null? Icons.edit:Icons.arrow_forward_ios_sharp))
      ],
    );
  }
}
