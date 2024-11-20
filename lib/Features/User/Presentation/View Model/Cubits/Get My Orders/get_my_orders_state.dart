part of 'get_my_orders_cubit.dart';

@immutable
sealed class GetMyOrdersState {}

final class GetMyOrdersInitial extends GetMyOrdersState {}

final class GetMyOrdersLoading extends GetMyOrdersState {}

final class GetMyOrdersSuccess extends GetMyOrdersState {
  final List<OrderItemEntity> orders;

  GetMyOrdersSuccess({required this.orders});
}

final class GetMyOrdersFailure extends GetMyOrdersState {
  final String errMessage;

  GetMyOrdersFailure({required this.errMessage});
}
