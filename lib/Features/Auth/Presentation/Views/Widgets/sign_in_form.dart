import 'package:coffee_oasis/Core/Helpers/space.dart';

import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Core/Widgets/cancel_button.dart';
import 'package:flutter/material.dart';


class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  static final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
                labelText: 'Email',
                validator: (v) {
                  return '';
                },
                onSaved: (s) {}),
            Space.k24,
            AppTextField(
                labelText: 'Password',
                validator: (v) {
                  return '';
                },
                onSaved: (s) {}),
            Space.k40,
          
          const CancelButton()
          ],
        ));
  }
}
