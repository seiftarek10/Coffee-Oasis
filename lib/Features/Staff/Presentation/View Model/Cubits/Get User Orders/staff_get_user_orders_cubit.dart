import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/get_user_orders_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'staff_get_user_orders_state.dart';

class StaffGetUserOrdersCubit extends BaseCubit<StaffGetUserOrdersState> {
  StaffGetUserOrdersCubit(this._staffGetAllOrdersUseCase)
      : super(StaffGetUserOrdersInitial());
  final StaffGetUserOrdersUseCase _staffGetAllOrdersUseCase;

  Stream<void> getUserOrders(
      {required bool isDelivery, required String id}) async* {
    safeEmit(StaffGetUserOrdersInitial());

    Stream<Either<Failure, List<OrderEntity>>> response =
        _staffGetAllOrdersUseCase.execute(isDelivery: isDelivery, id: id);

    await for (var result in response) {
      yield* result.fold(
        (failure) async* {
          safeEmit(StaffGetUserOrdersFailure(errMessage: failure.errMessage));
        },
        (orders) async* {
          safeEmit(StaffGetUserOrdersSuccess(orders: orders));
        },
      );
    }
  }
}
