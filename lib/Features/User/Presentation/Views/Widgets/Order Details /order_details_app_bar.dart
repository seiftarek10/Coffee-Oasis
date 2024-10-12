import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderDetailsAppBar extends StatelessWidget {
  const OrderDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
   
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_rounded, size: 28,color: Colors.white,)),
      
        const Spacer(),
        Text('Order Details', style: Fonts.font35_700White),
        const Spacer(),
       const SizedBox(width: 30),



      ],
    );
  }
}
