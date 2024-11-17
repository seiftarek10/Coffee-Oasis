part of 'handle_favorite_cubit.dart';

@immutable
sealed class HandleFavoriteState {}

final class HandleFavoriteInitial extends HandleFavoriteState {}

final class HandleFavoriteLoading extends HandleFavoriteState {}

final class IsExistState extends HandleFavoriteState {
  final bool isExist;

  IsExistState({required this.isExist});
}

final class GetFavoriteSuccess extends HandleFavoriteState {
  final List<CoffeeEntity> favCoffee;

  GetFavoriteSuccess({required this.favCoffee});
}

final class AddFavoriteSuccess extends HandleFavoriteState {}

final class DeleteFavoriteSuccess extends HandleFavoriteState {}

final class HandleFavoriteFailure extends HandleFavoriteState {
  final String errMessage;

  HandleFavoriteFailure({required this.errMessage});
}
