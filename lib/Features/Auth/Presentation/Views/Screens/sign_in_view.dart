import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Use%20Case/sign_in_use_case.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/View%20Models/Cubits/Sign%20In/sign_in_cubit.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/Bloc%20Widgets/sign_in_listner.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/auth_header_text.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/no_account_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignInCubit(SignInUseCase(getIt.get<AuthRepoImpl>())),
      child: Scaffold(
        body: SafeArea(
            child: Background(
                child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Space.k55,
                const HeaderText(title: 'Sign In', subTitle: [
                  'Welcome back to ',
                  'Coffee Oasis! ',
                  'Please sign in to continue'
                ]),
                Space.k100,
                const SignInBlocListner(),
                Space.k8,
                const NoAccountText()
              ],
            ),
          ),
        ))),
      ),
    );
  }
}
