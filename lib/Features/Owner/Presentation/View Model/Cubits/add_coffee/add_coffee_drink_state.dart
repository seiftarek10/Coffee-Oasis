part of 'add_coffee_drink_cubit.dart';

@immutable
sealed class AddCoffeeDrinkState {}

final class AddCoffeeDrinkInitial extends AddCoffeeDrinkState {}

final class AddCoffeeDrinkLoading extends AddCoffeeDrinkState {}

final class AddCoffeeDrinkFailure extends AddCoffeeDrinkState {
  final String errMessage;

  AddCoffeeDrinkFailure({required this.errMessage});
}

final class AddCoffeeDrinkSuccess extends AddCoffeeDrinkState {

}
