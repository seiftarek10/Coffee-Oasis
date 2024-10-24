import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_coffee/add_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/add_coffee_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddCoffeeBlocListner extends StatelessWidget {
  const AddCoffeeBlocListner({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCoffeeDrinkCubit, AddCoffeeDrinkState>(
        listener: (context, state) {
           if (state is AddCoffeeDrinkFailure) {
            failedMessage(context: context, message: state.errMessage);
          } else if (state is AddCoffeeDrinkSuccess) {
            GoRouter.of(context).pop();
            // context.read<GetAllCategoriesCubit>().getAllCategories();
            successMessage(
                context: context,
                message: 'The coffee has been added successfully');
          }
        }, child:  AddCoffeeDrinkForm(
          id: id
        ));
  }
}
