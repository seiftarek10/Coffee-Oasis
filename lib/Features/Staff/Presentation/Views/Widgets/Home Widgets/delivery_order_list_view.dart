import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/staff_order_item.dart';
import 'package:flutter/material.dart';

class DeliveryOrdersListView extends StatelessWidget {
  const DeliveryOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: StaffOrderItem(),
        );
      },
    );
  }
}
