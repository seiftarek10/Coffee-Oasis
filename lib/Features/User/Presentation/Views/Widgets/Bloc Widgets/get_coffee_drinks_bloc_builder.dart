import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Coffee%20Drinks/user_get_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/coffee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserGetCoffeeDrinksBlocBuilder extends StatelessWidget {
  const UserGetCoffeeDrinksBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserGetCoffeeDrinkCubit, UserGetCoffeeDrinkState>(
      builder: (context, state) {
        if (state is UserGetCoffeeDrinkSuccess) {
          if (state.coffee.isEmpty) {
            return const SliverToBoxAdapter(child: EmptyWidget(height: 1));
          }
          return UserHomeCoffeeDrinksListView(
            categoryName: 'Esspresso',
            coffeeDrinks: state.coffee,
            enabled: false,
          );
        } else if (state is UserGetCoffeeDrinkFailure) {
          return SliverToBoxAdapter(
              child: AppErrorWidget(onTap: () {}, text: 'Try,Again'));
        } else {
          return const SliverToBoxAdapter();
        }
      },
    );
  }
}
