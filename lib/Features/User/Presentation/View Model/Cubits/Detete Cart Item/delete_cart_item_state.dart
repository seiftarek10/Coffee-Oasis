part of 'delete_cart_item_cubit.dart';

@immutable
sealed class DeleteCartItemState {}

final class DeleteCartItemInitial extends DeleteCartItemState {}

final class DeleteCartItemLoading extends DeleteCartItemState {}

final class DeleteCartItemSuccess extends DeleteCartItemState {}

final class DeleteCartItemFailure extends DeleteCartItemState {
  final String errMessage;

  DeleteCartItemFailure({required this.errMessage});
}
