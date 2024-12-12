part of 'make_order_cubit.dart';

@immutable
sealed class MakeOrderState {}

final class MakeOrderInitial extends MakeOrderState {}

final class MakeOrderLoading extends MakeOrderState {}

final class MakeOrderSuccess extends MakeOrderState {}

final class PaySuccess extends MakeOrderState {}

final class MakeOrderFailure extends MakeOrderState {
  final String errMessage;

  MakeOrderFailure({required this.errMessage});
}
