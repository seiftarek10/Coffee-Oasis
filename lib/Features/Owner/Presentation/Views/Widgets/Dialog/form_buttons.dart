import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/button.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/statefull_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          child: DialogButton(
            title: 'Cancel',
            titleColor: Colors.black,
            backgroundColor: AppColors.kWhiteObacity,
            onPressed: cancel ??
                () {
                  GoRouter.of(context).pop();
                },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StatefulDialogButton(
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
