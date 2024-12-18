import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_category/update_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/edit_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditCategoryBlocListner extends StatelessWidget {
  const EditCategoryBlocListner(
      {super.key, required this.categoryEntity, required this.index});
  final CategoryEntity categoryEntity;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCategoryCubit, UpdateCategoryState>(
      listener: (context, state) async {
        if (state is UpdateCategorySuccess) {
          GoRouter.of(context).pop();
          successMessage(
              context: context,
              message: 'The category has been modified successfully');
          await context
              .read<OwnerGetAllCategoriesCubit>()
              .getAllCategories(remoteSource: true);
        } else if (state is UpdateCategoryFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
      child: ManageCategoryEditForm(
        categoryEntity: categoryEntity,
        index: index,
      ),
    );
  }
}
