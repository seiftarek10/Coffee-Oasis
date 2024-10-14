import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Cart/cart_slideable_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Routes.coffeeDetails);
          },
          child:  Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: CartSlideableItem(
              itemKey: Key(index.toString()),
            ),
          ),
        );
      }, childCount: 20),
    );
  }
}
