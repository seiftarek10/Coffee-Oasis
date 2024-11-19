import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/coffee_item_in_order_container.dart';
import 'package:flutter/material.dart';

class AllCoffeeOrderListView extends StatelessWidget {
  const AllCoffeeOrderListView({super.key, required this.allOrderCoffee});
  final List<OrderItemEntity> allOrderCoffee;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: allOrderCoffee.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: CoffeeItemInStaffOrderDetailsContainer(
              order: allOrderCoffee[index],
            ),
          );
        });
  }
}
