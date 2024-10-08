import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/dialog_button.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/dialog_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EditCoffeeDrinkForm extends StatelessWidget {
  const EditCoffeeDrinkForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        DialogTextField(
          labelText: 'Lettee',
          onSaved: (v) {},
        ),
        const SizedBox(height: 40),
        DialogTextField(
          labelText: 'Description',
          onSaved: (v) {},
        ),
        const SizedBox(height: 40),
        DialogTextField(
          labelText: r'70 $',
          onSaved: (v) {},
        ),
        const SizedBox(height: 60),
        Row(
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
              title: 'Edit',
              titleColor: Colors.white,
              backgroundColor: AppColors.kPrimaryColor,
              onPresed: () {
                
              },
            ),
            ),
          ],
        ),
      ],
    ));
  }
}


