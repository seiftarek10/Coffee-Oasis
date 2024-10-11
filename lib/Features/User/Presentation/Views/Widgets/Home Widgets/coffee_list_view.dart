import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/coffee_drink_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeCoffeeDrinksListView extends StatelessWidget {
  const HomeCoffeeDrinksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 180 / 280,
            crossAxisSpacing: 15,
            mainAxisSpacing: 40,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(Routes.coffeeDetails);
                },
                child: const HomeCoffeeDrinkItem());
          }, childCount: 20)),
    );
  }
}
