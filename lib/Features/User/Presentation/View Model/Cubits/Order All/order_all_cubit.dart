import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/order_all_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'order_all_state.dart';

class OrderAllCubit extends BaseCubit<OrderAllState> {
  OrderAllCubit(this._orderAllUseCase) : super(OrderAllInitial());
  final OrderAllUseCase _orderAllUseCase;

  Future<void> orderAll() async {
    safeEmit(OrderAllLoading());
    Either<Failure, void> response = await _orderAllUseCase.execute();
    response.fold(
        (failure) => safeEmit(OrderAllFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(OrderAllSuccess()));
  }
}
