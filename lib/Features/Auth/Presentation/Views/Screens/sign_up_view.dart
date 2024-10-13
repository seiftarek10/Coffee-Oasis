import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/auth_header_text.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/already_have_account.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Background(
              child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Space.k40,
              const HeaderText(
                title: 'Sign Up',
                subTitle:
                    'Dive into a world of flavor-join Coffee Oasis today!',
              ),
              Space.k40,
              const SignUpForm(),
              Space.k8,
              const AlreadyHaveAccountText()
            ],
          ),
        ),
      ))),
    );
  }
}


