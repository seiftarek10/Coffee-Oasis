import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Helpers/validation_form.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Widgets/app_button.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Entity/user_entity.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/View%20Models/Cubits/Sign%20Up/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  static final GlobalKey<FormState> _key = GlobalKey();
  static UserEntity userEntity = UserEntity();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
                labelText: 'Email',
                validator: (email) {
                  return ValidationForm.validEmail(email);
                },
                onSaved: (email) {
                  userEntity.email = email;
                }),
            Space.k24,
            AppTextField(
                labelText: 'Password',
                validator: (password) {
                  return ValidationForm.validPassword(password);
                },
                onSaved: (password) {
                  userEntity.password = password;
                }),
            Space.k24,
            AppTextField(
                labelText: 'User Name',
                validator: (userName) {
                  return ValidationForm.nullOrEpmty(userName);
                },
                onSaved: (userName) {
                  userEntity.userName = userName;
                }),
            Space.k24,
            AppTextField(
                labelText: 'Phone Number',
                keyboardType: TextInputType.number,
                validator: (phone) {
                  return ValidationForm.validPhoneNumber(phone);
                },
                onSaved: (phone) {
                  userEntity.phoneNumber = phone;
                }),
            Space.k24,
            AppTextField(
                labelText: 'Address',
                validator: (address) {
                  return ValidationForm.nullOrEpmty(address);
                },
                onSaved: (address) {
                  userEntity.address = address;
                }),
            Space.k40,
            AppButton(
              backgroundColor: AppColors.kPrimaryColor,
              onPressed: (trigger) async {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();
                  trigger();
                  await _signUp(context);
                  trigger();
                }
              },
              title: 'SIGN UP',
              titleColor: Colors.white,
            )
          ],
        ));
  }

  Future<void> _signUp(BuildContext context) async {
    await BlocProvider.of<SignUpCubit>(context).signUp(userEntity: userEntity);
  }
}
