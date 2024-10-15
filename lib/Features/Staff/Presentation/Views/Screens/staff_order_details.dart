import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/button.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/order_details_header_text.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/payment_summary_contaier.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/requester_info.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/staff_order_container.dart';

import 'package:flutter/material.dart';

class StaffOrderDetailsView extends StatelessWidget {
  const StaffOrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Background(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Space.k40,
                              const OrderDetailsHeaderText(),
                              Space.k40,
                              const RequesterInfo(),
                              Space.k24,
                              const StaffOrderContainer(
                                deliver: true,
                              ),
                              Space.k24,
                              const StaffPaymentSummaryContaier(
                                deliver: true,
                              ),
                              Space.k40,
                              const StaffOrderDetailsButton()
                            ]))))));
  }
}
