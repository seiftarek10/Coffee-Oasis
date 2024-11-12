part of 'get_favorites_coffee_cubit.dart';

@immutable
sealed class GetFavoritesCoffeeState {}

final class GetFavoritesCoffeeInitial extends GetFavoritesCoffeeState {}

final class GetFavoritesCoffeeLoading extends GetFavoritesCoffeeState {}

final class GetFavoritesCoffeeSuccess extends GetFavoritesCoffeeState {
  final List<CoffeeEntity> favCoffee;

  GetFavoritesCoffeeSuccess({required this.favCoffee});
}

final class GetFavoritesCoffeeFailure extends GetFavoritesCoffeeState {
  final String errMeassage;

  GetFavoritesCoffeeFailure({required this.errMeassage});
}
