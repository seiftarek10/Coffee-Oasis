import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_coffee/add_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_category_coffee_drinks.dart/get_category_coffee_drinks_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/add_coffee_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddCoffeeBlocListner extends StatelessWidget {
  const AddCoffeeBlocListner(
      {super.key, required this.id, required this.category});
  final String id;
  final String category;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCoffeeDrinkCubit, AddCoffeeDrinkState>(
        listener: (context, state) async {
          if (state is AddCoffeeDrinkFailure) {
            failedMessage(context: context, message: state.errMessage);
          } else if (state is AddCoffeeDrinkSuccess) {
            GoRouter.of(context).pop();
            successMessage(
                context: context,
                message: 'The coffee has been added successfully');
            await context
                .read<GetCategoryCoffeeDrinksCubit>()
                .getCategoryCoffeeDrink(id: id, remoteSource: true);
          }
        },
        child: AddCoffeeDrinkForm(
          id: id,
          category: category,
        ));
  }
}
