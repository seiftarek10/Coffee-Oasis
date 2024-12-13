import 'package:coffee_oasis/Core/NetWork/Dio%20Services/api_services.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent_input_model.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  static initializeStripe() async {
    await dotenv.load(fileName: '.env');
    String publishableKey = dotenv.env['stripePublishableKey']!;
    Stripe.publishableKey = publishableKey;
  }

  Future<PaymentIntentModel> _createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentModelInput}) async {
    String secretKey = dotenv.env['stripeSecretKey']!;
    var response = await getIt.get<ApiServices>().post(
        endPoint: 'https://api.stripe.com/v1/payment_intents',
        body: {
          'amount': paymentIntentModelInput.amount,
          'currency': paymentIntentModelInput.currency
        },
        header: {
          'Authorization': 'Bearer $secretKey',
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
