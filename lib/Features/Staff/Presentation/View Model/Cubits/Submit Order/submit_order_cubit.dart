import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/submit_order_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'submit_order_state.dart';

class SubmitOrderCubit extends BaseCubit<SubmitOrderState> {
  SubmitOrderCubit(this._submitOrderUseCase) : super(SubmitOrderInitial());

  final SubmitOrderUseCase _submitOrderUseCase;

  Future<void> submitOrder(
      {required String orderId, required String coffeeId}) async {
    Either<Failure, void> response =
        await _submitOrderUseCase.execute(param: [orderId, coffeeId]);
    response.fold(
        (failure) =>
            safeEmit(SubmitOrderFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(SubmitOrderSuccess()));
  }
}
