import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/app_bar.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_category_coffee_drinks.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_category_coffee_drinks.dart/get_category_coffee_drinks_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/Bloc%20Widgets/get_coffee_drinks_bloc_builder.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetCategoryCoffeeDrinksCubit(
            GetCategoryCoffeeDrinksUseCase(getIt.get<OwnerRepoImpl>()))
          ..getCategoryCoffeeDrink(id: categoryEntity.id!),
        child: Scaffold(
            floatingActionButton: AddFloatingActionButton(
              id: categoryEntity.id!,
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
                              HeaderBar(
                                headerText: categoryEntity.name ?? 'No Name',
                              ),
                              GetCoffeeDrinksBlocBuilder(
                                id: categoryEntity.id!,
                              )
                            ]))))));
  }
}
