import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/order_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.orders});

  final List<OrderItemEntity> orders;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(Routes.orderDetails, extra: orders[index]);
          },
          child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: OrderItem(
                order: orders[index],
              )),
        );
      }, childCount: orders.length),
    );
  }
}
