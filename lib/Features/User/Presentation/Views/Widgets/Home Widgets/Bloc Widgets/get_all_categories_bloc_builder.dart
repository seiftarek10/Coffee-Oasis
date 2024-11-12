import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20All%20Categories/user_get_all_categories_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/all_categories_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserGetAllCategoriesBlocBuilder extends StatelessWidget {
  const UserGetAllCategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserGetAllCategoriesCubit, UserGetAllCategoriesState>(
        builder: (context, state) {
      if (state is UserGetAllCategoriesSuccess) {
        return UserHomeCategoriesListView(
          categories: state.categories,
          enabled: false,
        );
      } else if (state is UserGetAllCategoriesFailure) {
        return Center(child: Text(state.errMssage));
      } else {
        return UserHomeCategoriesListView(
          categories: List.generate(7, (index) => CategoryEntity()),
          enabled: true,
        );
      }
    });
  }
}
