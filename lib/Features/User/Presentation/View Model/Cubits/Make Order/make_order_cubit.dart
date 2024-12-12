import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent_input_model.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/make_order_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/payment_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'make_order_state.dart';

class MakeOrderCubit extends BaseCubit<MakeOrderState> {
  MakeOrderCubit(this._makeOrderUseCase, this._paymentUseCase)
      : super(MakeOrderInitial());
  final MakeOrderUseCase _makeOrderUseCase;

  final PaymentUseCase _paymentUseCase;

  Future<void> pay(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    safeEmit(MakeOrderLoading());
    var response =
        await _paymentUseCase.execute(param: paymentIntentInputModel);
    response.fold(
        (failure) => safeEmit(MakeOrderFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(PaySuccess()));
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
