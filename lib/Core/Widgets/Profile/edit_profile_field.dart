import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/cancel_button.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class EditFieldBody extends StatelessWidget {
  const EditFieldBody(
      {super.key,
      required this.labelText,
      required this.onSaved,
      this.keyboardType});

  final String labelText;
  final void Function(String?) onSaved;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                  labelText: labelText,
                  keyboardType: keyboardType,
                  validator: (v) {
                    return '';
                  },
                  onSaved: onSaved),
              Space.k40,
              const Row(
                children: [
                  Expanded(
                    child: CancelButton(
                  
                      
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                  child: CancelButton(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
