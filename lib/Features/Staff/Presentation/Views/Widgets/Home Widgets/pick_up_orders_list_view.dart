import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/staff_order_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PickUpOrdersListView extends StatelessWidget {
  const PickUpOrdersListView({super.key, required this.orders});
  // final List<QueryDocumentSnapshot<Object?>> orders;
  final List<UserOrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(Routes.staffOrderDetails);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: StaffOrderItem(
              order: orders[index],
              isDelivery: false,
            ),
          ),
        );
      },
    );
  }
}
