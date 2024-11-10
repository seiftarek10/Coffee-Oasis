import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/make_order_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'make_order_state.dart';

class MakeOrderCubit extends Cubit<MakeOrderState> {
  MakeOrderCubit(this._makeOrderUseCase) : super(MakeOrderInitial());
  final MakeOrderUseCase _makeOrderUseCase;

  Future<void> makeOrder({required OrderEntity order}) async {
    emit(MakeOrderLoading());
    Either<Failure, void> response =
        await _makeOrderUseCase.execute(param: order);
    response.fold(
        (failure) => emit(MakeOrderFailure(errMessage: failure.errMessage)),
        (success) => emit(MakeOrderSuccess()));
  }
}
