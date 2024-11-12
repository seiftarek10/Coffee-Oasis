import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/header_order_container.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/pay_ment_summary.dart';
import 'package:flutter/material.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return AppClipReact(
        radiusForAll: true,
        child: Container(
            padding: const EdgeInsets.all(15),
            color: AppColors.kWhiteObacity,
            child: Column(children: [
              HeaderOrderCotainer(
                orderCoffeeInfo: order.coffee,
                counter: order.counter,
              ),
              Space.k20,
              PaymentSummary(
                price: order.price ?? 0,
                counter: order.counter,
              )
            ])));
  }
}
