import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(
      {super.key,
      required this.onTap,
      required this.text,
      this.color,
      this.height});
  final void Function() onTap;
  final String text;
  final Color? color;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height * (height ?? 1)),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.replay_circle_filled_rounded,
                size: 50.h, color: color ?? Colors.white),
            Text(text,
                style: Fonts.font35_700White
                    .copyWith(color: color ?? Colors.white))
          ],
        ),
      ),
    );
  }
}
