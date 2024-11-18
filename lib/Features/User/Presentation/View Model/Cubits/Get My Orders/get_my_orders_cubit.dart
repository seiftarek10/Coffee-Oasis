import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_my_orders_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'get_my_orders_state.dart';

class GetMyOrdersCubit extends BaseCubit<GetMyOrdersState> {
  GetMyOrdersCubit(this._getMyOrdersUseCase) : super(GetMyOrdersInitial());
  final GetMyOrdersUseCase _getMyOrdersUseCase;

  Future<void> getMyOrders() async {
    safeEmit(GetMyOrdersLoading());
    Either<Failure, List<OrderItemEntity>> response =
        await _getMyOrdersUseCase.execute();
    response.fold(
        (failure) =>
            safeEmit(GetMyOrdersFailure(errMessage: failure.errMessage)),
        (data) => safeEmit(GetMyOrdersSuccess(orders: data)));
  }
}
