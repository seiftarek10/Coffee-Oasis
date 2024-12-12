import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Delivery/Presentation/Views/Widgets/all_orders_list_view.dart';
import 'package:coffee_oasis/Features/Delivery/Presentation/Views/Widgets/home_header.dart';
import 'package:flutter/material.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Background(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomScrollView(
                        physics: const BouncingScrollPhysics(),
                        slivers: [
                          SliverToBoxAdapter(
                              child: Column(children: [
                            Space.k24,
                            const DeliveryHomeHeader(),
                            Space.k40
                          ])),
                          const DeliveryAllOrdersListView()
                        ])))));
  }
}
