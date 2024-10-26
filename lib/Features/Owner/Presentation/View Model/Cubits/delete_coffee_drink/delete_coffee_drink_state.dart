part of 'delete_coffee_drink_cubit.dart';

@immutable
sealed class DeleteCoffeeDrinkState {}

final class DeleteCoffeeDrinkInitial extends DeleteCoffeeDrinkState {}

final class DeleteCoffeeDrinkLoading extends DeleteCoffeeDrinkState {}

final class DeleteCoffeeDrinkSuccess extends DeleteCoffeeDrinkState {}

final class DeleteCoffeeDrinkFailure extends DeleteCoffeeDrinkState {
  final String errMessage;

  DeleteCoffeeDrinkFailure({required this.errMessage});
}
