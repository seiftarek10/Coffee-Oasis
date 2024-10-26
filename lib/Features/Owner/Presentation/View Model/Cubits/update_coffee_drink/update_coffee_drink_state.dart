part of 'update_coffee_drink_cubit.dart';

@immutable
sealed class UpdateCoffeeDrinkState {}

final class UpdateCoffeeDrinkInitial extends UpdateCoffeeDrinkState {}

final class UpdateCoffeeDrinkLoading extends UpdateCoffeeDrinkState {}

final class UpdateCoffeeDrinkSuccess extends UpdateCoffeeDrinkState {}

final class UpdateCoffeeDrinkFailure extends UpdateCoffeeDrinkState {
  final String errMessage;

  UpdateCoffeeDrinkFailure({required this.errMessage});
}
