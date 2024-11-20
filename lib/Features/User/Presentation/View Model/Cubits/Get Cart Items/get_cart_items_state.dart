part of 'get_cart_items_cubit.dart';

@immutable
sealed class GetCartItemsState {}

final class GetCartItemsInitial extends GetCartItemsState {}

final class GetCartItemsLoading extends GetCartItemsState {}

final class GetCartItemsSuccess extends GetCartItemsState {
  final List<OrderItemEntity> cartItems;

  GetCartItemsSuccess({required this.cartItems});
}

final class GetCartItemsFailure extends GetCartItemsState {
  final String errMessage;

  GetCartItemsFailure({required this.errMessage});
}
