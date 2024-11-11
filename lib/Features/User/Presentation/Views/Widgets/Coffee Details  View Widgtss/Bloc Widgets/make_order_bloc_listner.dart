import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Cart%20Items/get_cart_items_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Make%20Order/make_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MakeOrderBlocListner extends StatelessWidget {
  const MakeOrderBlocListner(
      {super.key, required this.child, required this.fromCartView});

  final Widget child;
  final bool fromCartView;

  @override
  Widget build(BuildContext context) {
    return BlocListener<MakeOrderCubit, MakeOrderState>(
      listener: (context, state) async {
        if (state is MakeOrderSuccess) {
          successMessage(
              context: context,
              message: 'The order completed successfully',
              backgroundColor: AppColors.kPrimaryColor);
          GoRouter.of(context).pop();
          if (fromCartView) {
            await context.read<GetCartItemsCubit>().getCartItems();
          }
        } else if (state is MakeOrderFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
      child: child,
    );
  }
}