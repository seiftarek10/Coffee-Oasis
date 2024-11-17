import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/View%20Models/Cubits/Sign%20Up/sign_up_cubit.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/Views/Widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBlocListner extends StatelessWidget {
  const SignUpBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          successMessage(
              context: context, message: 'Email Created Successfuly');
          GoRouter.of(context).push(Routes.signin);
        } else if (state is SignUpFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
      child: const SignUpForm(),
    );
  }
}
