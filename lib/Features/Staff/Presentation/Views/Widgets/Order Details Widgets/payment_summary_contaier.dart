import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:flutter/material.dart';

class StaffPaymentSummaryContaier extends StatelessWidget {
  const StaffPaymentSummaryContaier({super.key, required this.deliver});

  final bool deliver;
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
            'Coffee Price :',
            style: Fonts.font18_700,
          ),
          Text(
            r'$ 4.53',
            style: Fonts.font18_700,
          )
        ]),
        Space.k12,
        deliver
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
            r'$ 4.53',
            style: Fonts.font18_700,
          )
        ]),
      ]))
    ]);
  }
}
