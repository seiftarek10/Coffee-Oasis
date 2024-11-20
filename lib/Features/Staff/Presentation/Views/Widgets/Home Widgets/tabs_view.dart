import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/Bloc%20Widgets/get_delivery_orders_bloc_builder.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/Bloc%20Widgets/get_pick_up_bloc_builder.dart';
import 'package:flutter/material.dart';

class TabsView extends StatelessWidget {
  const TabsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        children: [GetPickUpBlocBuilder(), GetDeliveryOrdersBlocBuilder()],
      ),
    );
  }
}
