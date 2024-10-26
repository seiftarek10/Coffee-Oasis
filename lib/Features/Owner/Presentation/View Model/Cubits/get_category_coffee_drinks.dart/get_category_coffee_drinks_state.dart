part of 'get_category_coffee_drinks_cubit.dart';

@immutable
sealed class GetCategoryCoffeeDrinksState {}

final class GetCategoryCoffeeDrinksInitial
    extends GetCategoryCoffeeDrinksState {}

final class GetCategoryCoffeeDrinksLoading
    extends GetCategoryCoffeeDrinksState {}

final class GetCategoryCoffeeDrinksSuccess
    extends GetCategoryCoffeeDrinksState {
  final List<CoffeeEntity> coffeeDrinks;

  GetCategoryCoffeeDrinksSuccess({required this.coffeeDrinks});
}

final class GetCategoryCoffeeDrinksFailure
    extends GetCategoryCoffeeDrinksState {
  final String errMessage;

  GetCategoryCoffeeDrinksFailure({required this.errMessage});
}
