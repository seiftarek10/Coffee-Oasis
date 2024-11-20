import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';

import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/all_coffee_order_list_view.dart';
import 'package:flutter/material.dart';

class StaffOrderContainer extends StatelessWidget {
  const StaffOrderContainer(
      {super.key, required this.deliver, required this.allOrderCoffee});
  final List<OrderItemEntity>? allOrderCoffee;
  final bool deliver;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Order info', style: Fonts.font24_700.copyWith(color: Colors.white)),
      Space.k8,
      AppWhiteContainer(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(children: [
            AllCoffeeOrderListView(
              allOrderCoffee: allOrderCoffee ?? [],
            ),
            deliver
                ? Column(children: [
                    const Divider(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery :',
                            style: Fonts.font18_700,
                          ),
                          Text(
                            'Tamim',
                            style: Fonts.font18_700,
                          )
                        ])
                  ])
                : const SizedBox.shrink()
          ]))
    ]);
  }
}
