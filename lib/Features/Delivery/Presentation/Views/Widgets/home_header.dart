import 'package:coffee_oasis/Core/Widgets/rich_header_text.dart';
import 'package:flutter/material.dart';

class DeliveryHomeHeader extends StatelessWidget {
  const DeliveryHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: RichHeaderText(
            title: 'Orders',
            subTitle: [
              "Welcome back! Today’s deliveries are waiting. ",
              'for you ',
              "Let’s hit the road and bring fresh coffee to our ",
              'valued customers!'
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.logout, color: Colors.white, size: 36)),
        )
      ],
    );
  }
}
