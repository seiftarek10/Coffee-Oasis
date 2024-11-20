import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:flutter/material.dart';

class StaffPaymentSummaryContaier extends StatefulWidget {
  const StaffPaymentSummaryContaier(
      {super.key, required this.deliver, required this.allCOrderCoffee});
  final List<OrderItemEntity> allCOrderCoffee;
  final bool deliver;

  @override
  State<StaffPaymentSummaryContaier> createState() =>
      _StaffPaymentSummaryContaierState();
}

class _StaffPaymentSummaryContaierState
    extends State<StaffPaymentSummaryContaier> {
  int totalCoffeeItems = 0;
  num totalPrice = 0;

  @override
  void initState() {
    for (var coffee in widget.allCOrderCoffee) {
      totalCoffeeItems += coffee.counter;
      totalPrice += coffee.price ?? 0;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Payment Summary',
          style: Fonts.font24_700.copyWith(color: Colors.white)),
      Space.k8,
      AppWhiteContainer(
          child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Total Coffee Items :',
            style: Fonts.font18_700,
          ),
          Text(
            totalCoffeeItems.toString(),
            style: Fonts.font18_700,
          )
        ]),
        Space.k12,
        widget.deliver
            ? Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery cost :',
                        style: Fonts.font18_700,
                      ),
                      Text(
                        r'$ 4.53',
                        style: Fonts.font18_700,
                      )
                    ]),
                Space.k12
              ])
            : const SizedBox.shrink(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Total Price :',
            style: Fonts.font18_700,
          ),
          Text(
            "${totalPrice.toString()} " r'$',
            style: Fonts.font18_700,
          )
        ])
      ]))
    ]);
  }
}
