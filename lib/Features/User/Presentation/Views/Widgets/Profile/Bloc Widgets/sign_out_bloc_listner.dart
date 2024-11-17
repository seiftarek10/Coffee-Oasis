import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/View%20Models/Cubits/Sign%20Out/sign_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignOutBlocListner extends StatelessWidget {
  const SignOutBlocListner({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
        listener: (context, state) {
          if (state is SignOutSuccess) {
            GoRouter.of(context).go(Routes.signin);
          } else if (state is SignOutFailure) {
            failedMessage(context: context, message: state.errMessage);
          }
        },
        child: child);
  }
}
