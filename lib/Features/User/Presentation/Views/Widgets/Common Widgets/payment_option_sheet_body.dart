import 'package:coffee_oasis/Core/Helpers/space.dart';

import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/Widgets/app_button.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/payment_option_widget.dart';

import 'package:flutter/material.dart';

class PaymentOptionsBottomSheetBody extends StatefulWidget {
  const PaymentOptionsBottomSheetBody({
    super.key,
    required this.onPressed,
    required this.currentIndex,
  });

  final Future<void> Function(Function) onPressed;
  final ValueChanged<int> currentIndex;

  @override
  State<PaymentOptionsBottomSheetBody> createState() =>
      _PaymentOptionsBottomSheetBodyState();
}

class _PaymentOptionsBottomSheetBodyState
    extends State<PaymentOptionsBottomSheetBody> {
  List<String> icons = [
    Assets.imagesCreditCards,
    Assets.imagesPaypalSvgrepoCom,
    Assets.imagesCash
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
          child: Column(children: [
            Row(
                children: List.generate(3, (index) {
              return Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: PaymentOptionWidget(
                          icon: icons[index],
                          isSelected: currentIndex == index,
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                            widget.currentIndex(currentIndex);
                          })));
            })),
            Space.k40,
            Row(children: [
              Expanded(
                  child: AppButton(
                      titleColor: Colors.white,
                      backgroundColor: AppColors.kPrimaryColor,
                      radius: 20,
                      squareShape: true,
                      title: 'Confirm',
                      onPressed: widget.onPressed))
            ])
          ]))
    ]);
  }
}
