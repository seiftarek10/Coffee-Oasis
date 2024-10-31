import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/update_category_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_category_state.dart';

class UpdateCategoryCubit extends Cubit<UpdateCategoryState> {
  UpdateCategoryCubit(this._updateCategoryUseCase)
      : super(UpdateCategoryInitial());

  final UpdateCategoryUseCase _updateCategoryUseCase;

  Future<void> updateCategory(
      {required String id, required Map<String, dynamic> body}) async {
    emit(UpdateCategoryLoading());
    Either<Failure, void> response =
        await _updateCategoryUseCase.execute(param: [id, body]);

    response.fold(
        (failure) =>
            emit(UpdateCategoryFailure(errMessage: failure.errMessage)),
        (success) => emit(UpdateCategorySuccess()));
  }
}
