import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_coffee_drinks_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'user_get_coffee_drink_state.dart';

class UserGetCoffeeDrinkCubit extends Cubit<UserGetCoffeeDrinkState> {
  UserGetCoffeeDrinkCubit(this._userGetCoffeeDrinksUseCase)
      : super(UserGetCoffeeDrinkInitial());

  final UserGetCoffeeDrinksUseCase _userGetCoffeeDrinksUseCase;

  Future<void> getCoffeeDrinks({String? id}) async {
    emit(UserGetCoffeeDrinkLoadigng());

    Either<Failure, List<CoffeeEntity>> response =
        await _userGetCoffeeDrinksUseCase.execute(param: id);

    response.fold(
        (failure) =>
            emit(UserGetCoffeeDrinkFailure(errMessage: failure.errMessage)),
        (data) => emit(UserGetCoffeeDrinkSuccess(coffee: data)));
  }
}
