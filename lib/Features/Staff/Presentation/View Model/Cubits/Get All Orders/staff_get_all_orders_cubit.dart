import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/get_all_order_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:meta/meta.dart';

part 'staff_get_all_orders_state.dart';

class StaffGetAllOrdersCubit extends BaseCubit<StaffGetAllOrdersState> {
  final StaffGetAllOrdersUseCase _getAllOrdersUseCase;

  StaffGetAllOrdersCubit(this._getAllOrdersUseCase)
      : super(StaffGetAllOrdersInitial());

  void getAllOrders({required bool isDelivery}) {
    safeEmit(StaffGetAllOrdersLoading());

    _getAllOrdersUseCase.execute(isDelivery: isDelivery).listen(
      (result) {
        result.fold(
          (failure) => safeEmit(
              StaffGetAllOrdersFailure(errMessage: failure.errMessage)),
          (orders) => safeEmit(StaffGetAllOrdersSuccess(orders: orders)),
        );
      },
      onError: (error) {
        safeEmit(StaffGetAllOrdersFailure(errMessage: error.toString()));
      },
    );
  }
}
