import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_category_coffee_drinks.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'get_category_coffee_drinks_state.dart';

class GetCategoryCoffeeDrinksCubit
    extends BaseCubit<GetCategoryCoffeeDrinksState> {
  GetCategoryCoffeeDrinksCubit(this._getCategoryCoffeeDrinksUseCase)
      : super(GetCategoryCoffeeDrinksInitial());

  final GetCategoryCoffeeDrinksUseCase _getCategoryCoffeeDrinksUseCase;

  Future<void> getCategoryCoffeeDrink(
      {required String id, required bool remoteSource}) async {
    safeEmit(GetCategoryCoffeeDrinksLoading());
    Either<Failure, List<CoffeeEntity>> response =
        await _getCategoryCoffeeDrinksUseCase
            .execute(param: [id, remoteSource]);
    response.fold(
        (failure) => safeEmit(
            GetCategoryCoffeeDrinksFailure(errMessage: failure.errMessage)),
        (data) => safeEmit(GetCategoryCoffeeDrinksSuccess(coffeeDrinks: data)));
  }
}
