import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/View%20Model/Cubits/Submit%20Order/submit_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SubmitOrderBlocListner extends StatelessWidget {
  const SubmitOrderBlocListner({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SubmitOrderCubit, SubmitOrderState>(
      listener: (context, state) {
        if (state is SubmitOrderSuccess) {
          successMessage(context: context, message: 'Submit Order');
          GoRouter.of(context).pop();
        }

        if (state is SubmitOrderFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
      child: child,
    );
  }
}
