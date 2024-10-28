import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/View%20Models/Cubits/Sign%20In/sign_in_cubit.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInBlocListner extends StatelessWidget {
  const SignInBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          GoRouter.of(context).push(Routes.user);
        } else if (state is SignInFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
      child: const SignInForm(),
    );
  }
}
