import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/add_coffee_drink_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'add_coffee_drink_state.dart';

class AddCoffeeDrinkCubit extends BaseCubit<AddCoffeeDrinkState> {
  AddCoffeeDrinkCubit(this._addCoffeeDrinkUseCase)
      : super(AddCoffeeDrinkInitial());

  final AddCoffeeDrinkUseCase _addCoffeeDrinkUseCase;

  Future<void> addCoffeeDrink(
      {required CoffeeEntity coffee, required String docId}) async {
    safeEmit(AddCoffeeDrinkLoading());
    Either<Failure, void> response =
        await _addCoffeeDrinkUseCase.execute(param: [coffee, docId]);
    response.fold(
        (failure) =>
            safeEmit(AddCoffeeDrinkFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(AddCoffeeDrinkSuccess()));
  }
}
