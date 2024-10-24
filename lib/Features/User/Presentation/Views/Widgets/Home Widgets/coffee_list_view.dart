import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/coffee_drink_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UserHomeCoffeeDrinksListView extends StatelessWidget {
  const UserHomeCoffeeDrinksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 170.w / 240.h,
            crossAxisSpacing: 15,
            mainAxisSpacing: 40,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(Routes.coffeeDetails);
                },
                child: const UserHomeCoffeeDrinkItem());
          }, childCount: 20)),
    );
  }
}
