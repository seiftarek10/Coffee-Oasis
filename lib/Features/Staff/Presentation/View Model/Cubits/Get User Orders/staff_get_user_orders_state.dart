part of 'staff_get_user_orders_cubit.dart';

@immutable
sealed class StaffGetUserOrdersState {}

final class StaffGetUserOrdersInitial extends StaffGetUserOrdersState {}

final class StaffGetUserOrdersLoading extends StaffGetUserOrdersState {}

final class StaffGetUserOrdersFailure extends StaffGetUserOrdersState {
  final String errMessage;

  StaffGetUserOrdersFailure({required this.errMessage});
}

final class StaffGetUserOrdersSuccess extends StaffGetUserOrdersState {
  final List<OrderItemEntity> orders;

  StaffGetUserOrdersSuccess({required this.orders});
}
