import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FormButtons extends StatelessWidget {
  const FormButtons({
    super.key, required this.buttonTitle, required this.onPressed,
  });
  final String buttonTitle;
  final void Function() onPressed;
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
        Space.k12,
        Expanded(
          child: DialogButton(
            title: buttonTitle,
            titleColor: Colors.white,
            backgroundColor: AppColors.kPrimaryColor,
            onPresed:onPressed,
          ),
        ),
      ],
    );
  }
}
