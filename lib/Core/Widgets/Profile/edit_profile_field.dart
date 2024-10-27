import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/form_buttons.dart';
import 'package:flutter/material.dart';

class EditFieldBody extends StatelessWidget {
  const EditFieldBody(
      {super.key,
      required this.labelText,
      required this.onSaved,
      this.keyboardType,
      required this.onPressed, required this.formKey});

  final String labelText;
  final void Function(String?) onSaved;
  final TextInputType? keyboardType;
  final Future<void> Function(Function) onPressed;
  final GlobalKey<FormState>formKey;

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
              Form(
                key: formKey,
                child: AppTextField(
                    labelText: labelText,
                    keyboardType: keyboardType,
                    onSaved: onSaved),
              ),
              Space.k40,
              FormButtons(buttonTitle: 'Edit', onPressed: onPressed),
            ],
          ),
        ),
      ),
    );
  }
}
