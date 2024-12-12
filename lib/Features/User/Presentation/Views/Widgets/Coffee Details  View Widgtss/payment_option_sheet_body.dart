import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/payment_option_widget.dart';
import 'package:flutter/material.dart';

class PaymentOptionsBottomSheetBody extends StatefulWidget {
  const PaymentOptionsBottomSheetBody({
    super.key,
  });

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
      Column(
        children: [
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
                  },
                ),
              ));
            }),
          )
        ],
      )
    ]);
  }
}
