import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            overlayColor: AppColors.kPrimaryColor,
            padding: const EdgeInsets.symmetric(vertical: 10),
            backgroundColor: Colors.white),
        onPressed: onPressed ??
            () {
              GoRouter.of(context).pop();
            },
        child: Text('Cancel',
            style: Fonts.font20_700.copyWith(color: Colors.black)));
  }
}
