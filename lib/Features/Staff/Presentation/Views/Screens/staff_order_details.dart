import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Staff/Data/Repo/staff_repo_impl.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/submit_delivery_order_use_case.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/submit_picku_order_use_case.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/View%20Model/Cubits/Submit%20Order/submit_order_cubit.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/button.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/order_details_header_text.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/payment_summary_contaier.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/user_info.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/staff_order_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffOrderDetailsView extends StatelessWidget {
  const StaffOrderDetailsView(
      {super.key, required this.userOrder, required this.delivery});
  final UserOrderEntity userOrder;
  final bool delivery;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubmitOrderCubit(
          SubmitDeliveryOrderUseCase(getIt.get<StaffRepoImpl>()),
          SubmitPickUpOrderUseCase(getIt.get<StaffRepoImpl>())),
      child: Scaffold(
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
                                StaffUserInfoContainerinOrderDetails(
                                  user: userOrder.user ?? UserEntity(),
                                ),
                                Space.k24,
                                StaffOrderContainer(
                                  deliver: delivery,
                                  allOrderCoffee: userOrder.coffee,
                                ),
                                Space.k24,
                                StaffPaymentSummaryContaier(
                                  deliver: delivery,
                                  allCOrderCoffee: userOrder.coffee ?? [],
                                ),
                                Space.k40,
                                StaffOrderDetailsButton(
                                  isDelivery: delivery,
                                  userOrder: userOrder,
                                ),
                                Space.k40
                              ])))))),
    );
  }
}
