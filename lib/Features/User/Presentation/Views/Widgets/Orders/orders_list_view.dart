import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/order_item.dart';
import 'package:flutter/material.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
     return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {
          
          },
          child: const Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: OrderItem()
          ),
        );
      }, childCount: 20),
    );
  }
}