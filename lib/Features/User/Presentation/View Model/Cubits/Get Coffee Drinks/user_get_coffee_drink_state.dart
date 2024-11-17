part of 'user_get_coffee_drink_cubit.dart';

@immutable
sealed class UserGetCoffeeDrinkState {}

final class UserGetCoffeeDrinkInitial extends UserGetCoffeeDrinkState {}

final class UserGetCoffeeDrinkLoadigng extends UserGetCoffeeDrinkState {}

final class UserGetCoffeeDrinkSuccess extends UserGetCoffeeDrinkState {
  final List<CoffeeEntity> coffee;

  UserGetCoffeeDrinkSuccess({required this.coffee});
}

final class UserGetCoffeeDrinkFailure extends UserGetCoffeeDrinkState {
  final String errMessage;

  UserGetCoffeeDrinkFailure({required this.errMessage});
}
