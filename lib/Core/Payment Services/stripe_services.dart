import 'package:coffee_oasis/Core/NetWork/Dio%20Services/api_services.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent_input_model.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  static initializeStripe() {
    Stripe.publishableKey =
        'pk_test_51QVCvcCTbCHoJuAwplSNXPRBKG3WRoNEGyKKNp2TrjaI5oUCmiAPwdQXdSFz2FcpwAZ6sQq54u2E6EPzQzMwT4ah00VG99mB3j';
  }

  Future<PaymentIntentModel> _createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentModelInput}) async {
    var response = await getIt.get<ApiServices>().post(
        endPoint: 'https://api.stripe.com/v1/payment_intents',
        body: {
          'amont': paymentIntentModelInput.amount,
          'currency': paymentIntentModelInput.currency
        },
        header: {
          'Authorization':
              'Bearer sk_test_51QVCvcCTbCHoJuAwTPkHGej1bytqCUW03vfsuUlMVvOnX9SYkLTZXbtcagQznUl1LxUIfkcBVJ2AUd4fQqy45D3t00mhoPGng3',
        },
        contentType: Headers.formUrlEncodedContentType);

    return PaymentIntentModel.fromJson(response);
  }

  Future _initPaymentSheet({required String clientSecret}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            merchantDisplayName: 'Seif',
            paymentIntentClientSecret: clientSecret));
  }

  Future _presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future pay({required PaymentIntentInputModel paymentIntentModelInput}) async {
    PaymentIntentModel paymentIntentModel = await _createPaymentIntent(
        paymentIntentModelInput: paymentIntentModelInput);
    await _initPaymentSheet(clientSecret: paymentIntentModel.clientSecret!);
    await _presentPaymentSheet();
  }
}
