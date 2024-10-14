import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/delivery_order_list_view.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/pick_up_orders_list_view.dart';
import 'package:flutter/material.dart';

class TabsView extends StatelessWidget {
  const TabsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        children: [
          PickUpOrdersListView(),
       DeliveryOrdersListView()
        ],
      ),
    );
  }
}
