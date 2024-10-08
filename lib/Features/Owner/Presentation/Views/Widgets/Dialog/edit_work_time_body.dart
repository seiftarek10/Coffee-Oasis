import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/dialog_button.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/dialog_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/am_pm_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditWorkTimeBody extends StatelessWidget {
  const EditWorkTimeBody({super.key, required this.startTime, required this.endTime});
  final String startTime, endTime;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 200.h),
            DialogTextField(labelText: startTime, onSaved: (c) {},suffixIcon: Padding(
              padding: const EdgeInsets.only(right:  5.0),
              child: AmPmSwitcher(onSelectionChanged: (value){}),
            )),
            const SizedBox(height: 20),
              DialogTextField(labelText: endTime, onSaved: (c) {},suffixIcon: Padding(
              padding: const EdgeInsets.only(right:  5.0),
              child: AmPmSwitcher(onSelectionChanged: (value){}),
            )),
           
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
