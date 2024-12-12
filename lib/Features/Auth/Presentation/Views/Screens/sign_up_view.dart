import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Use%20Case/sign_up_use_case.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/View%20Models/Cubits/Sign%20Up/sign_up_cubit.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/Bloc%20Widgets/sign_up_listner.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/auth_header_text.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/already_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignUpCubit(SignUpUseCase(getIt.get<AuthRepoImpl>())),
      child: Scaffold(
        body: SafeArea(
            child: Background(
                child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Space.k40,
                const HeaderText(title: 'Sign Up', subTitle: [
                  'Dive into a world of flavor-join ',
                  'Coffee Oasis ',
                  ' today!'
                ]),
                Space.k40,
                const SignUpBlocListner(),
                Space.k8,
                const AlreadyHaveAccountText()
              ],
            ),
          ),
        ))),
      ),
    );
  }
}
