part of 'order_all_cubit.dart';

@immutable
sealed class OrderAllState {}

final class OrderAllInitial extends OrderAllState {}

final class OrderAllLoading extends OrderAllState {}

final class OrderAllSuccess extends OrderAllState {}

final class OrderAllFailure extends OrderAllState {
  final String errMessage;

  OrderAllFailure({required this.errMessage});
}
