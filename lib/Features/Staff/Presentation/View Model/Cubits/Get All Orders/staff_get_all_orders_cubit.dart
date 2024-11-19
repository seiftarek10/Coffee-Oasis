import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/get_all_order_use_case.dart';
import 'package:meta/meta.dart';

part 'staff_get_all_orders_state.dart';

class StaffGetAllOrdersCubit extends BaseCubit<StaffGetAllOrdersState> {
  final StaffGetAllOrdersUseCase _getAllOrdersUseCase;

  StaffGetAllOrdersCubit(this._getAllOrdersUseCase)
      : super(StaffGetAllOrdersInitial());

  List<UserOrderEntity> deliveryOrders = [];
  List<UserOrderEntity> pickupOrders = [];

  bool inDelivery = false;

  void getAllOrders({required bool isDelivery}) {
    safeEmit(StaffGetAllOrdersLoading());

    _getAllOrdersUseCase.execute(isDelivery: isDelivery).listen(
      (result) {
        result.fold(
            (failure) => safeEmit(
                StaffGetAllOrdersFailure(errMessage: failure.errMessage)),
            (orders) {
          if (isDelivery) {
            safeEmit(StaffGetAllDeliveryOrdersSuccess(orders: orders));
            deliveryOrders = orders;
          } else {
            safeEmit(StaffGetAllPickUpOrdersSuccess(orders: orders));
            pickupOrders = orders;
          }
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
              order.user?.userName?.toLowerCase() == word.toLowerCase())
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
