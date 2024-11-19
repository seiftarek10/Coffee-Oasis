part of 'staff_get_all_orders_cubit.dart';

@immutable
sealed class StaffGetAllOrdersState {}

final class StaffGetAllOrdersInitial extends StaffGetAllOrdersState {}

final class StaffGetAllOrdersLoading extends StaffGetAllOrdersState {}

final class StaffGetAllOrdersFailure extends StaffGetAllOrdersState {
  final String errMessage;

  StaffGetAllOrdersFailure({required this.errMessage});
}

final class StaffGetAllPickUpOrdersSuccess extends StaffGetAllOrdersState {
  final List<UserOrderEntity> orders;

  StaffGetAllPickUpOrdersSuccess({required this.orders});
}

final class StaffGetAllDeliveryOrdersSuccess extends StaffGetAllOrdersState {
  final List<UserOrderEntity> orders;

  StaffGetAllDeliveryOrdersSuccess({required this.orders});
}
