import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent_input_model.dart';

import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Make%20Order/make_order_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/Bloc%20Widgets/make_order_bloc_listner.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Common%20Widgets/payment_option_sheet_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentOrderBottomSheet extends StatefulWidget {
  const PaymentOrderBottomSheet({
    super.key,
    required this.order,
    required this.fromCartView,
  });

  final UserOrderEntity order;
  final bool fromCartView;

  @override
  State<PaymentOrderBottomSheet> createState() =>
      _PaymentOptionsBottomSheetBodyState();
}

class _PaymentOptionsBottomSheetBodyState
    extends State<PaymentOrderBottomSheet> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MakeOrderBlocListner(
        fromCartView: widget.fromCartView,
        finalOrder: widget.order,
        child: PaymentOptionsBottomSheetBody(
          currentIndex: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          onPressed: (trigger) async {
            trigger();
            await _makeOrder();
            trigger();
          },
        ));
  }

  Future<void> _makeOrder() async {
    if (currentIndex == 0) {
      BlocProvider.of<MakeOrderCubit>(context).pay(
          paymentIntentInputModel: PaymentIntentInputModel(
              amount: widget.order.coffee![0].price!.toInt() * 100,
              currency: 'Usd'));
    } else if (currentIndex == 2) {
      widget.order.isPaid = false;
      await BlocProvider.of<MakeOrderCubit>(context).makeOrder(
          order: widget.order,
          id: widget.order.coffee![0].coffee.id!,
          fromCart: widget.fromCartView,
          isDelivery: widget.order.coffee![0].isDelivery ?? true);
    }
  }
}
