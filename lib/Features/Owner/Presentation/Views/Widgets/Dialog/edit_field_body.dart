import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/dialog_button.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditFieldBody extends StatelessWidget {
  const EditFieldBody({
    super.key,
    required this.labelText,
    required this.onSaved,
    this.keyboardType
  });

  final String labelText;
  final void Function(String?) onSaved;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 250.h),
            AppTextField(
                labelText: labelText,
                keyboardType: keyboardType,
                validator: (v) {
                  return '';
                },
                onSaved: onSaved),
            const SizedBox(height: 50),
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
                    onPresed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
