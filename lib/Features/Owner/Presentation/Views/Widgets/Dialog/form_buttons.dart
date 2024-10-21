import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormButtons extends StatelessWidget {
  const FormButtons({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    this.isLoading
  });
  final String buttonTitle;
  final void Function() onPressed;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DialogButton(
            title: 'Cancel',
            titleColor: Colors.black,
            backgroundColor: AppColors.kWhiteObacity,
            onPresed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: DialogButton(
            isLoading: isLoading,
            title: buttonTitle,
            titleColor: Colors.white,
            backgroundColor: AppColors.kPrimaryColor,
            onPresed: onPressed,
          ),
        ),
      ],
    );
  }
}
