import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_category_coffee_drinks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_category_coffee_drinks_state.dart';

class GetCategoryCoffeeDrinksCubit extends Cubit<GetCategoryCoffeeDrinksState> {
  GetCategoryCoffeeDrinksCubit(this._getCategoryCoffeeDrinksUseCase)
      : super(GetCategoryCoffeeDrinksInitial());

  final GetCategoryCoffeeDrinksUseCase _getCategoryCoffeeDrinksUseCase;

  Future<void> getCategoryCoffeeDrink({required String id,required bool remoteSource}) async {
    emit(GetCategoryCoffeeDrinksLoading());
    var response = await _getCategoryCoffeeDrinksUseCase.execute(param: [id,remoteSource]);
    response.fold(
        (failure) => emit(
            GetCategoryCoffeeDrinksFailure(errMessage: failure.errMessage)),
        (data) => emit(GetCategoryCoffeeDrinksSuccess(coffeeDrinks: data)));
  }
}
