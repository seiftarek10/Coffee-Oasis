import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Helpers/validation_form.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Widgets/app_button.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/View%20Models/Cubits/Sign%20In/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  static final GlobalKey<FormState> _key = GlobalKey();

  static String? email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          AppTextField(
              labelText: 'Email',
              validator: (email) {
                return ValidationForm.nullOrEpmty(email);
              },
              onSaved: (value) {
                email = value;
              }),
          Space.k24,
          AppTextField(
              labelText: 'Password',
              validator: (password) {
                return ValidationForm.validPassword(password);
              },
              onSaved: (value) {
                password = value;
              }),
          Space.k40,
          AppButton(
            needCirculartPadding: true,
            backgroundColor: AppColors.kPrimaryColor,
            onPressed: (trigger) async {
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                trigger();
                await _singIn(context);
                trigger();
              }
            },
            title: 'SIGN IN',
            titleColor: Colors.white,
          )
        ]));
  }

  Future<void> _singIn(BuildContext context) async {
    await BlocProvider.of<SignInCubit>(context)
        .signIn(email: email!, password: password!);
  }
}
