import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_coffee_drinks_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'user_get_coffee_drink_state.dart';

class UserGetCoffeeDrinkCubit extends BaseCubit<UserGetCoffeeDrinkState> {
  UserGetCoffeeDrinkCubit(this._userGetCoffeeDrinksUseCase)
      : super(UserGetCoffeeDrinkInitial());

  final UserGetCoffeeDrinksUseCase _userGetCoffeeDrinksUseCase;

  List<CoffeeEntity> allCoffee = [];
  Future<void> getCoffeeDrinks({String? id}) async {
    safeEmit(UserGetCoffeeDrinkLoadigng());

    Either<Failure, List<CoffeeEntity>> response =
        await _userGetCoffeeDrinksUseCase.execute(param: id);

    response.fold(
        (failure) =>
            safeEmit(UserGetCoffeeDrinkFailure(errMessage: failure.errMessage)),
        (data) {
      safeEmit(UserGetCoffeeDrinkSuccess(coffee: data));
      allCoffee = data;
    });
  }

  void serachForCoffee({required String searchedCoffee}) {
    List<CoffeeEntity> coffee = allCoffee
        .where((coffee) =>
            coffee.name!.toLowerCase().startsWith(searchedCoffee.toLowerCase()))
        .toList();
    emit(UserGetCoffeeDrinkSuccess(coffee: coffee));
  }
}
