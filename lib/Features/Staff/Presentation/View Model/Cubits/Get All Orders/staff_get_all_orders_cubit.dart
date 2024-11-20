import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/get_delivery_order_use_case.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/get_pickup_orders_use_case.dart';
import 'package:meta/meta.dart';

part 'staff_get_all_orders_state.dart';

class StaffGetAllOrdersCubit extends BaseCubit<StaffGetAllOrdersState> {
  final StaffGetDeliveryOrdersUseCase _getDeliveryOrdersUseCase;
  final StaffGetPickUpOrdersUseCase _getPickUpOrdersUseCase;

  StaffGetAllOrdersCubit(
      this._getDeliveryOrdersUseCase, this._getPickUpOrdersUseCase)
      : super(StaffGetAllOrdersInitial());

  List<UserOrderEntity> deliveryOrders = [];
  List<UserOrderEntity> pickupOrders = [];

  bool inDelivery = false;

  void getDeliveryOrders() {
    safeEmit(StaffGetAllOrdersLoading());

    _getDeliveryOrdersUseCase.execute().listen(
      (result) {
        result.fold(
            (failure) => safeEmit(
                StaffGetAllOrdersFailure(errMessage: failure.errMessage)),
            (orders) {
          safeEmit(StaffGetAllDeliveryOrdersSuccess(orders: orders));
          deliveryOrders = orders;
        });
      },
      onError: (error) {
        safeEmit(StaffGetAllOrdersFailure(errMessage: error.toString()));
      },
    );
  }

  void getPickupOrders() {
    safeEmit(StaffGetAllOrdersLoading());

    _getPickUpOrdersUseCase.execute().listen(
      (result) {
        result.fold(
            (failure) => safeEmit(
                StaffGetAllOrdersFailure(errMessage: failure.errMessage)),
            (orders) {
          safeEmit(StaffGetAllPickUpOrdersSuccess(orders: orders));
          pickupOrders = orders;
        });
      },
      onError: (error) {
        safeEmit(StaffGetAllOrdersFailure(errMessage: error.toString()));
      },
    );
  }

  void searchOrders({required String word}) {
    List<UserOrderEntity> searchedList = [];
    if (inDelivery) {
      searchedList = deliveryOrders
          .where((order) =>
              order.user?.userName
                  ?.toLowerCase()
                  .startsWith(word.toLowerCase()) ??
              false)
          .toList()
          .toList();
      safeEmit(StaffGetAllDeliveryOrdersSuccess(orders: searchedList));
    } else {
      searchedList = pickupOrders
          .where((order) =>
              order.user?.userName
                  ?.toLowerCase()
                  .startsWith(word.toLowerCase()) ??
              false)
          .toList();
      safeEmit(StaffGetAllPickUpOrdersSuccess(orders: searchedList));
    }
  }
}
