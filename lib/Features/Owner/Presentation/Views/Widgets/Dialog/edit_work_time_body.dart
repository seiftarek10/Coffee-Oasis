import 'package:coffee_oasis/Core/Widgets/cancel_button.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/am_pm_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditWorkTimeBody extends StatelessWidget {
  const EditWorkTimeBody(
      {super.key, required this.startTime, required this.endTime});
  final String startTime, endTime;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 200.h),
            AppTextField(
                labelText: startTime,
                validator: (v) {
                  return '';
                },
                onSaved: (c) {},
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: AmPmSwitcher(onSelectionChanged: (value) {}),
                )),
            const SizedBox(height: 20),
            AppTextField(
                labelText: endTime,
                validator: (v) {
                  return '';
                },
                onSaved: (c) {},
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: AmPmSwitcher(onSelectionChanged: (value) {}),
                )),
            const SizedBox(height: 50),
            const Row(
              children: [
                Expanded(
                  child: CancelButton(
                   
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CancelButton(
                
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
