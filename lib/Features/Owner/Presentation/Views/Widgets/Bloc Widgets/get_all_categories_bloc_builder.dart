import 'package:coffee_oasis/Core/Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_state.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/all_categories_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetAllCategoriesBlocBuilder extends StatelessWidget {
  const GetAllCategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
        builder: (context, state) {
      if (state is GetAllCategoriesSuccess) {
        if (state.categories.isEmpty) {
          return const EmptyWidget();
        }
        return ManageAllCategoriesListView(
          categoriesList: state.categories,
        );
      } else if (state is GetAllCategoriesFailure) {
        return AppErrorWidget(
          text: "${state.errMessage} try,again",
          onTap: () async {
            await BlocProvider.of<GetAllCategoriesCubit>(context).getAllCategories();
          },
        );
      } else {
        return Skeletonizer(
          enabled: true,
          child: ManageAllCategoriesListView(
              categoriesList: List.generate(7, (index) {
            return CategoryEntity();
          })),
        );
      }
    });
  }
}
