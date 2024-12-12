import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentOptionWidget extends StatefulWidget {
  const PaymentOptionWidget(
      {super.key,
      required this.isSelected,
      required this.icon,
      required this.onTap});

  final bool isSelected;
  final void Function() onTap;
  final String icon;

  @override
  State<PaymentOptionWidget> createState() => _PaymentOptionWidgetState();
}

class _PaymentOptionWidgetState extends State<PaymentOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        height: MediaQuery.sizeOf(context).height * 0.07,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            border: Border.all(
                color:
                    widget.isSelected ? AppColors.kPrimaryColor : Colors.grey,
                width: widget.isSelected ? 6 : 3,
                style: BorderStyle.solid),
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: SvgPicture.asset(
          widget.icon,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
