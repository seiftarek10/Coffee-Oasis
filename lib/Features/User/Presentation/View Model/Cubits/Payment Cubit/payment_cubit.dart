import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent_input_model.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/payment_use_case.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends BaseCubit<PaymentState> {
  PaymentCubit(this._paymentUseCase) : super(PaymentInitial());

  final PaymentUseCase _paymentUseCase;

  Future<void> pay(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    safeEmit(PaymentLoading());
    var response =
        await _paymentUseCase.execute(param: paymentIntentInputModel);
    response.fold(
        (failure) => safeEmit(PaymentFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(PaymentSuccess()));
  }
}
