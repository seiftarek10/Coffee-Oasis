import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/update_category_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

part 'update_category_state.dart';

class UpdateCategoryCubit extends BaseCubit<UpdateCategoryState> {
  UpdateCategoryCubit(this._updateCategoryUseCase)
      : super(UpdateCategoryInitial());

  final UpdateCategoryUseCase _updateCategoryUseCase;

  Future<void> updateCategory(
      {required String id, required Map<String, dynamic> body}) async {
    safeEmit(UpdateCategoryLoading());
    Either<Failure, void> response =
        await _updateCategoryUseCase.execute(param: [id, body]);

    response.fold(
        (failure) =>
            safeEmit(UpdateCategoryFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(UpdateCategorySuccess()));
  }
}
