import 'package:coffee_oasis/Core/Theme/fonts.dart';
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
        return ManageAllCategoriesListView(
          categoriesList: state.categories,
        );
      } else if (state is GetAllCategoriesFailure) {
        return Center(
            child: Text(state.errMessage, style: Fonts.font40_700White));
      } else {
        // return const Skeletonizer(
        //   enabled: true,
        //   child: ManageAllCategoriesListView(
        //     categoriesList: [],
        //   ),
        // );
          return const Center(
            child: CircularProgressIndicator(color: Colors.white,));
      }
    });
  }
}
