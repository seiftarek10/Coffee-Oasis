import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/pay_pal_input_model.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent_input_model.dart';

import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/Widgets/app_button.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Make%20Order/make_order_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/Bloc%20Widgets/make_order_bloc_listner.dart';

import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/payment_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentOptionsBottomSheetBody extends StatefulWidget {
  const PaymentOptionsBottomSheetBody({
    super.key,
    required this.order,
    required this.fromCartView,
  });

  final UserOrderEntity order;
  final bool fromCartView;

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
    return MakeOrderBlocListner(
      fromCartView: widget.fromCartView,
      finalOrder: widget.order,
      child: Wrap(children: [
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
                        onPressed: (trigger) async {
                          trigger();
                          await _makeOrder();
                          trigger();
                        }))
              ])
            ]))
      ]),
    );
  }

  Future<void> _makeOrder() async {
    if (currentIndex == 0) {
      BlocProvider.of<MakeOrderCubit>(context).payByStripe(
          paymentIntentInputModel: PaymentIntentInputModel(
              amount: widget.order.coffee![0].price!.toInt() * 100,
              currency: 'Usd'));
    } else if (currentIndex == 1) {
      BlocProvider.of<MakeOrderCubit>(context).payByPayPal(
          payPalInputModel: PayPalInputModel(
              amount: widget.order.coffee![0].price!.toString(),
              order: PayPalOrderItemModel(
                  name: widget.order.coffee![0].coffee.name!,
                  quantity: widget.order.coffee![0].counter,
                  price: widget.order.coffee![0].price!.toString())),
          context: context);
    } else {
      widget.order.coffee![0].isPaid = false;
      await BlocProvider.of<MakeOrderCubit>(context).makeOrder(
          order: widget.order,
          id: widget.order.coffee![0].coffee.id!,
          fromCart: widget.fromCartView,
          isDelivery: widget.order.coffee![0].isDelivery ?? true);
    }
  }
}
