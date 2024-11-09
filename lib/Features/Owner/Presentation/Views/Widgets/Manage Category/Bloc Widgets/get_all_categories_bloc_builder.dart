import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';

import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_state.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/all_categories_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllCategoriesBlocBuilder extends StatelessWidget {
  const GetAllCategoriesBlocBuilder({super.key, required this.cubit});
  final OwnerGetAllCategoriesCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerGetAllCategoriesCubit, OwnerGetAllCategoriesState>(
        builder: (context, state) {
      if (state is GetAllCategoriesSuccess) {
        if (state.categories.isEmpty) {
          return const AppEmptyWidget(
            height: 1,
          );
        }
        return ManageAllCategoriesListView(
          categoriesList: state.categories,
          cubit: cubit,
        );
      } else if (state is GetAllCategoriesFailure) {
        return AppErrorWidget(
            text: "${state.errMessage} try,again",
            onTap: () async {
              await BlocProvider.of<OwnerGetAllCategoriesCubit>(context)
                  .getAllCategories();
            });
      } else {
        return const Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        ));
      }
    });
  }
}
