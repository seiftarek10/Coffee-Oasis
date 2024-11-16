import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Cart%20Items/get_cart_items_cubit.dart';

import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Order%20All/order_all_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderAllButtonBlocListner extends StatelessWidget {
  const OrderAllButtonBlocListner({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderAllCubit, OrderAllState>(
      listener: (context, state) async {
        if (state is OrderAllSuccess) {
          successMessage(
              context: context,
              message: 'The order all completed successfully',
              backgroundColor: AppColors.kPrimaryColor);
          await context.read<GetCartItemsCubit>().getCartItems();
        } else if (state is OrderAllFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
      child: child,
    );
  }
}
