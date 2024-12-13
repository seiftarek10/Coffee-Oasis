import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/pay_pal_input_model.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent_input_model.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/make_order_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/payment_stripe_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';

part 'make_order_state.dart';

class MakeOrderCubit extends BaseCubit<MakeOrderState> {
  MakeOrderCubit(
    this._makeOrderUseCase,
    this._paymentByStripeUseCase,
  ) : super(MakeOrderInitial());
  final MakeOrderUseCase _makeOrderUseCase;

  final PaymentByStripeUseCase _paymentByStripeUseCase;

  Future<void> payByStripe(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    safeEmit(MakeOrderLoading());
    var response =
        await _paymentByStripeUseCase.execute(param: paymentIntentInputModel);
    response.fold(
        (failure) => safeEmit(MakeOrderFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(PaySuccess()));
  }

  Future<void> payByPayPal(
      {required PayPalInputModel payPalInputModel,
      required BuildContext context}) async {
    safeEmit(MakeOrderLoading());
    await dotenv.load(fileName: '.env');
    String clientId = dotenv.env['payPalClientId']!;
    String secretKey = dotenv.env['payPalSecretKey']!;
    Future.microtask(() {
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckoutView(
            sandboxMode: true,
            clientId: clientId,
            secretKey: secretKey,
            transactions: [
              {
                "amount": {
                  "total": payPalInputModel.amount,
                  "currency": "USD",
                  "details": {
                    "subtotal": payPalInputModel.amount,
                    "shipping": "0",
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",
                "item_list": {
                  "items": [
                    {
                      "name": payPalInputModel.order.name,
                      "quantity": payPalInputModel.order.quantity,
                      "price": payPalInputModel.order.price,
                      "currency": "USD"
                    },
                  ],
                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              safeEmit(PaySuccess());
            },
            onError: (error) {
              safeEmit(MakeOrderFailure(errMessage: error.toString()));
              GoRouter.of(context).pop();
            },
            onCancel: () {
              safeEmit(MakeOrderFailure(errMessage: 'Cancelled'));
            },
          ),
        ));
      }
    });
  }

  Future<void> makeOrder(
      {required UserOrderEntity order,
      required String id,
      required bool isDelivery,
      required bool fromCart}) async {
    safeEmit(MakeOrderLoading());
    Either<Failure, void> response = await _makeOrderUseCase
        .execute(param: [order, id, fromCart, isDelivery]);
    response.fold(
        (failure) => safeEmit(MakeOrderFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(MakeOrderSuccess()));
  }
}
