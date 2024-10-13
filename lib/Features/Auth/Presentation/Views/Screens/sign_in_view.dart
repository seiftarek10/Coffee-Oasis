import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/auth_header_text.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/no_account_text.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                title: 'Sign In',
                subTitle:
                    'Welcome back to Coffee Oasis! Please sign in to continue',
              ),
              Space.k90,
              const SignInForm(),
              Space.k8,
              const NoAccountText()
            ],
          ),
        ),
      ))),
    );
  }
}
