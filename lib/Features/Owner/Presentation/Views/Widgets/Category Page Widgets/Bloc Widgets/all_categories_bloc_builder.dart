import 'package:coffee_oasis/Core/Widgets/States%20Widgets/circular_indicator.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_state.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/all_categroies_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategoriesListViewBlocBuilder extends StatelessWidget {
  const AllCategoriesListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerGetAllCategoriesCubit, OwnerGetAllCategoriesState>(
        builder: (context, state) {
      if (state is GetAllCategoriesSuccess) {
        if (state.categories.isEmpty) {
          return _buildEmptyWidget(context);
        }
        return OwnerAllCategoiresListView(
          categories: state.categories,
        );
      } else if (state is GetAllCategoriesFailure) {
        return _buildErrorWidget(context, state.errMessage);
      } else {
        return _buildLoadingWidget(context);
      }
    });
  }

  Widget _buildLoadingWidget(BuildContext context) {
    return const SliverToBoxAdapter(child: AppCircularIndicator(height: 0.6));
  }

  Widget _buildEmptyWidget(BuildContext context) {
    return const SliverToBoxAdapter(
        child: AppEmptyWidget(
      height: 0.6,
    ));
  }

  Widget _buildErrorWidget(BuildContext context, String text) {
    return SliverToBoxAdapter(
      child: AppErrorWidget(
          text: "$text try,again",
          onTap: () async {
            await BlocProvider.of<OwnerGetAllCategoriesCubit>(context)
                .getAllCategories();
          }),
    );
  }
}
