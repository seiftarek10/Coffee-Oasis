import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/staff_order_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeliveryAllOrdersListView extends StatelessWidget {
  const DeliveryAllOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Routes.staffOrderDetails);
          },
          child: const Padding(
            padding: EdgeInsets.only(bottom: 24),
            child: StaffOrderItem(),
          ),
        );
      }),
    );
  }
}
