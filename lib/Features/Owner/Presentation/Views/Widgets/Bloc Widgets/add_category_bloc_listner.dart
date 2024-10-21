import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_category/add_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_category/add_category_state.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddCategoryBlocListner extends StatelessWidget {
  const AddCategoryBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCategoryCubit, AddCategoryState>(
        listener: (context, state)  {
          if (state is AddCategoryFailureState) {
            failedMessage(context: context, message: state.errMessage);
          } else if (state is AddCategorySuccessState) {
            GoRouter.of(context).pop();
            successMessage(
                context: context,
                message: 'The category has been added successfully');
          }
        },
        child: const ManageCategoryForm());
  }
}
