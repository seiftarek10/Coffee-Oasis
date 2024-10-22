import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/app_bar.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/delete_category_use_case.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_all_categories.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/delete_category/delete_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Bloc%20Widgets/get_all_categories_bloc_builder.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageCategories extends StatelessWidget {
  const ManageCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final getAllCategoriesCubit = GetAllCategoriesCubit(
        GetAllCategoriesUseCase(getIt.get<OwnerRepoImpl>()));
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => getAllCategoriesCubit..getAllCategories()),
          BlocProvider(
              create: (context) => DeleteCategoryCubit(
                  DeleteCategoryUseCase(getIt.get<OwnerRepoImpl>())))
        ],
        child: Scaffold(
            floatingActionButton: ManageCategoryFloatingButton(
              cubit: getAllCategoriesCubit,
            ),
            resizeToAvoidBottomInset: true,
            body: SafeArea(
                child: Background(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Space.topPageSpace,
                              const HeaderBar(
                                headerText: 'All Categories',
                              ),
                              const Expanded(
                                  child: GetAllCategoriesBlocBuilder())
                            ]))))));
  }
}
