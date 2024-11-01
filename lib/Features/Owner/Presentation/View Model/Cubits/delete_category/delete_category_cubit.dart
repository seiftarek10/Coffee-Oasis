import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/delete_category_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit(this._deleteCategoryUseCase)
      : super(DeleteCategoryInitial());

  final DeleteCategoryUseCase _deleteCategoryUseCase;

  Future<void> deleteCategory(
      {required String id, required String? url, required int index}) async {
    emit(DeleteCategoryLoading());
    Either<Failure, void> response =
        await _deleteCategoryUseCase.execute(param: [id, url, index]);
    response.fold(
        (failure) =>
            emit(DeleteCategoryFailure(errMessage: failure.errMessage)),
        (success) => emit(DeleteCategorySuccess()));
  }
}
