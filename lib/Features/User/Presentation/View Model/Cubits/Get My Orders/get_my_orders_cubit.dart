import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_my_orders_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'get_my_orders_state.dart';

class GetMyOrdersCubit extends Cubit<GetMyOrdersState> {
  GetMyOrdersCubit(this._getMyOrdersUseCase) : super(GetMyOrdersInitial());
  final GetMyOrdersUseCase _getMyOrdersUseCase;

  Future<void> getMyOrders() async {
    emit(GetMyOrdersLoading());
    Either<Failure, List<OrderEntity>> response =
        await _getMyOrdersUseCase.execute();
    response.fold(
        (failure) => emit(GetMyOrdersFailure(errMessage: failure.errMessage)),
        (data) => emit(GetMyOrdersSuccess(orders: data)));
  }
}
