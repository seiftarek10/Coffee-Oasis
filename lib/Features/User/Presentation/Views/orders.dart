import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/order_header.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/orders_list_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/delete_note.dart';
import 'package:flutter/material.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
              SliverToBoxAdapter(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Space.k20,
                    const OrderHeader(),
                    Space.k40,
                    const DeleteNote(),
                    Space.k12,
                  ])),
              const OrdersListView()
            ])));
  }
}
