import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/form_buttons.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/am_pm_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditWorkTimeBody extends StatelessWidget {
  const EditWorkTimeBody({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.onSavedStartTime,
    required this.onSavedEndTime,
    required this.startTimeAmOrPm,
    required this.endTimeAmOrPm,
    required this.onPressed, required this.formKey,
  });
  final String startTime, endTime;
  final void Function(String?) onSavedStartTime, onSavedEndTime;
  final ValueChanged<String> startTimeAmOrPm, endTimeAmOrPm;
  final Future<void> Function(Function) onPressed;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key:formKey ,
              child: Column(children: [
                SizedBox(height: 200.h),
                AppTextField(
                    labelText: startTime,
                    onSaved: onSavedStartTime,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: AmPmSwitcher(onSelectionChanged: (value) {
                        startTimeAmOrPm(value);
                      }),
                    )),
                const SizedBox(height: 20),
                AppTextField(
                    labelText: endTime,
                    onSaved: onSavedEndTime,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: AmPmSwitcher(onSelectionChanged: (value) {
                        endTimeAmOrPm(value);
                      }),
                    )),
                const SizedBox(height: 50),
                FormButtons(buttonTitle: 'Edit', onPressed: onPressed)
              ]),
            )));
  }
}
