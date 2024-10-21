import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/delete_category_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'delete_category_state.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit(this._deleteCategoryUseCase)
      : super(DeleteCategoryInitial());

  final DeleteCategoryUseCase _deleteCategoryUseCase;

  Future<void> deleteCategory({required String id,required String url}) async {
    emit(DeleteCategoryLoading());
    var response = await _deleteCategoryUseCase.execute(param: [id,url]);
    response.fold(
        (failure) =>
            emit(DeleteCategoryFailure(errMessage: failure.errMessage)),
        (success) => emit(DeleteCategorySuccess()));
  }
}
