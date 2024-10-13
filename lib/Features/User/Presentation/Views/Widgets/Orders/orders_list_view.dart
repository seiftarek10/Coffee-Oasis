import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/order_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Routes.orderDetails);
          },
          child: const Padding(
              padding: EdgeInsets.only(bottom: 24.0), child: OrderItem()),
        );
      }, childCount: 20),
    );
  }
}
