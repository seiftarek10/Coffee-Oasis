import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Cart/cart_header.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Cart/cart_item_list_view.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                CartHeaderPage(),
                SizedBox(height: 40),
              ],
            ),
          ),
          CartItemListView()
        ],
      ),
    ));
  }
}
