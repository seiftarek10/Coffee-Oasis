import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/delete_coffee_drink_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
part 'delete_coffee_drink_state.dart';

class DeleteCoffeeDrinkCubit extends BaseCubit<DeleteCoffeeDrinkState> {
  DeleteCoffeeDrinkCubit(this._deleteCoffeeDrinkUseCase)
      : super(DeleteCoffeeDrinkInitial());

  final DeleteCoffeeDrinkUseCase _deleteCoffeeDrinkUseCase;

  Future<void> deleteCoffeeDrink({
    required String parentDocId,
    required String docId,
    required String photoUrl,
  }) async {
    safeEmit(DeleteCoffeeDrinkLoading());
    Either<Failure, void> response = await _deleteCoffeeDrinkUseCase
        .execute(param: [parentDocId, docId, photoUrl]);
    response.fold(
        (failure) =>
            safeEmit(DeleteCoffeeDrinkFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(DeleteCoffeeDrinkSuccess()));
  }
}
