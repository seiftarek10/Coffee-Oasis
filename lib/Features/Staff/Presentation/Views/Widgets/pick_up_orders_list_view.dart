import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/staff_order_item.dart';
import 'package:flutter/material.dart';

class PickUpOrdersListView extends StatelessWidget {
  const PickUpOrdersListView({super.key});

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
