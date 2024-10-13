import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/dialog_button.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddCoffeeDrinkForm extends StatelessWidget {
  const AddCoffeeDrinkForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        AppTextField(
          labelText: 'Coffee Drink Name',
          validator: (v) {
            return '';
          },
          onSaved: (v) {},
        ),
        const SizedBox(height: 40),
        AppTextField(
          labelText: 'Description',
          validator: (v) {
            return '';
          },
          onSaved: (v) {},
        ),
        const SizedBox(height: 40),
        AppTextField(
          labelText: 'Price',
          keyboardType: TextInputType.number,
          validator: (v) {
            return '';
          },
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
                title: 'Add',
                titleColor: Colors.white,
                backgroundColor: AppColors.kPrimaryColor,
                onPresed: () {},
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
