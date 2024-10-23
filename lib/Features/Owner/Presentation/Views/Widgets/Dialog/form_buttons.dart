import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Widgets/app_button.dart';
import 'package:coffee_oasis/Core/Widgets/cancel_button.dart';
import 'package:flutter/material.dart';

class FormButtons extends StatelessWidget {
  const FormButtons(
      {super.key,
      required this.buttonTitle,
      required this.onPressed,
      this.cancel});
  final String buttonTitle;
  final Future<void> Function(Function) onPressed;
  final void Function()? cancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CancelButton(onPressed: cancel),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: AppButton(
            title: buttonTitle,
            titleColor: Colors.white,
            backgroundColor: AppColors.kPrimaryColor,
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
