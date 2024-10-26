import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/delete_coffee_drink_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'delete_coffee_drink_state.dart';

class DeleteCoffeeDrinkCubit extends Cubit<DeleteCoffeeDrinkState> {
  DeleteCoffeeDrinkCubit(this._deleteCoffeeDrinkUseCase)
      : super(DeleteCoffeeDrinkInitial());

  final DeleteCoffeeDrinkUseCase _deleteCoffeeDrinkUseCase;

  Future<void> deleteCoffeeDrink({
    required String parentDocId,
    required String docId,
    required String photoUrl,
  }) async {
    emit(DeleteCoffeeDrinkLoading());
    var response = await _deleteCoffeeDrinkUseCase
        .execute(param: [parentDocId, docId, photoUrl]);
    response.fold(
        (failure) =>
            emit(DeleteCoffeeDrinkFailure(errMessage: failure.errMessage)),
        (success) => emit(DeleteCoffeeDrinkSuccess()));
  }
}
