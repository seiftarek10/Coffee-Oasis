part of 'submit_order_cubit.dart';

@immutable
sealed class SubmitOrderState {}

final class SubmitOrderInitial extends SubmitOrderState {}

final class SubmitOrderSuccess extends SubmitOrderState {}

final class SubmitOrderFailure extends SubmitOrderState {
  final String errMessage;

  SubmitOrderFailure({required this.errMessage});
}
