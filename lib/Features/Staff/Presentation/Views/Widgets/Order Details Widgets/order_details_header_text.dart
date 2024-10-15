import 'package:coffee_oasis/Core/Widgets/arrow_back.dart';
import 'package:coffee_oasis/Core/Widgets/rich_header_text.dart';
import 'package:flutter/material.dart';

class OrderDetailsHeaderText extends StatelessWidget {
  const OrderDetailsHeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         ArrowBackIcon(),
         Expanded(
           child: RichHeaderText(
            title: 'Order Details',
            smallTitle:true ,
            subTitle: [
              'Comprehensive ',
              'Information ',
              'to Manage Coffee Oasis Orders ',
              'Seamlessly'
            ],
                   ),
         )
      ],
    );
  }
}
