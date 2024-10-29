import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_category_coffee_drinks.dart/get_category_coffee_drinks_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_coffee_drink/update_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/edit_coffee_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpadateCoffeeDrinkBlocListner extends StatelessWidget {
  const UpadateCoffeeDrinkBlocListner(
      {super.key, required this.id, required this.coffeeEntity});

  final String id;
  final CoffeeEntity coffeeEntity;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCoffeeDrinkCubit, UpdateCoffeeDrinkState>(
      listener: (context, state) async {
        if (state is UpdateCoffeeDrinkSuccess) {
          GoRouter.of(context).pop();
          successMessage(
              context: context, message: 'Coffee Info Updated Successufly');
          await context
              .read<GetCategoryCoffeeDrinksCubit>()
              .getCategoryCoffeeDrink(id: id,remoteSource: true);
        } else if (state is UpdateCoffeeDrinkFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
      child: EditCoffeeDrinkForm(
        coffeeEntity: coffeeEntity,
        id: id,
      ),
    );
  }
}
