import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/submit_delivery_order_use_case.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/submit_picku_order_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'submit_order_state.dart';

class SubmitOrderCubit extends BaseCubit<SubmitOrderState> {
  SubmitOrderCubit(
      this._submitDeliveryOrderUseCase, this._submitPickUpOrderUseCase)
      : super(SubmitOrderInitial());

  final SubmitDeliveryOrderUseCase _submitDeliveryOrderUseCase;
  final SubmitPickUpOrderUseCase _submitPickUpOrderUseCase;

  Future<void> submitDeliveryOrder({required UserOrderEntity userOrder}) async {
    Either<Failure, void> response =
        await _submitDeliveryOrderUseCase.execute(param: userOrder);
    response.fold(
        (failure) =>
            safeEmit(SubmitOrderFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(SubmitOrderSuccess()));
  }

  Future<void> submitPickupOrder({required UserOrderEntity userOrder}) async {
    Either<Failure, void> response =
        await _submitPickUpOrderUseCase.execute(param: userOrder);
    response.fold(
        (failure) =>
            safeEmit(SubmitOrderFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(SubmitOrderSuccess()));
  }
}
