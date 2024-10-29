import 'dart:developer';

import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/delete_coffee_drink/delete_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_category_coffee_drinks.dart/get_category_coffee_drinks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteCoffeeDrinkBlocListner extends StatelessWidget {
  const DeleteCoffeeDrinkBlocListner(
      {super.key, required this.child, required this.id});
  final Widget child;
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteCoffeeDrinkCubit, DeleteCoffeeDrinkState>(
        listener: (context, state) async {
          if (state is DeleteCoffeeDrinkSuccess) {
            successMessage(
              context: context,
              message: 'Coffee Drink Deleted Successfully',
            );
            await context
                .read<GetCategoryCoffeeDrinksCubit>()
                .getCategoryCoffeeDrink(id: id, remoteSource: true);
          } else if (state is DeleteCoffeeDrinkFailure) {
            failedMessage(context: context, message: state.errMessage);
            log(state.errMessage);
          }
        },
        child: child);
  }
}
