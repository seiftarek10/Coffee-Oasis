import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/delete_category/delete_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteCategoryBlocListener extends StatelessWidget {
  const DeleteCategoryBlocListener({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteCategoryCubit, DeleteCategoryState>(
      listener: (context, state) async {
        if (state is DeleteCategorySuccess) {
          successMessage(
              context: context, message: 'Category Deleted Successfuly');
          context
              .read<OwnerGetAllCategoriesCubit>()
              .getAllCategories(remoteSource: true);
        } else if (state is DeleteCategoryFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
      child: child,
    );
  }
}
