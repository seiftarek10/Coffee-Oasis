import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/order_details_header_text.dart';

import 'package:flutter/material.dart';

class StaffOrderDetails extends StatelessWidget {
  const StaffOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Space.k40,
              const OrderDetailsHeaderText(),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}
