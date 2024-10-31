import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/add_coffee_drink_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_coffee_drink_state.dart';

class AddCoffeeDrinkCubit extends Cubit<AddCoffeeDrinkState> {
  AddCoffeeDrinkCubit(this._addCoffeeDrinkUseCase)
      : super(AddCoffeeDrinkInitial());

  final AddCoffeeDrinkUseCase _addCoffeeDrinkUseCase;

  Future<void> addCoffeeDrink(
      {required CoffeeEntity coffee, required String docId}) async {
    emit(AddCoffeeDrinkLoading());
    Either<Failure, void> response =
        await _addCoffeeDrinkUseCase.execute(param: [coffee, docId]);
    response.fold(
        (failure) =>
            emit(AddCoffeeDrinkFailure(errMessage: failure.errMessage)),
        (success) => emit(AddCoffeeDrinkSuccess()));
  }
}
