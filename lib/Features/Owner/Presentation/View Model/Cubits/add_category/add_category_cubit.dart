import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/add_category_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View Model/Cubits/add_category/add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit(this._addCategorUseCase) : super(AddCategoryInitialState());

  final AddCategorUseCase _addCategorUseCase;

  Future<void> addCategory({required CategoryEntity category}) async {
    emit(AddCategoryLoadingState());
    Either<Failure, String> response =
        await _addCategorUseCase.execute(param: category);
    response.fold(
        (failure) =>
            emit(AddCategoryFailureState(errMessage: failure.errMessage)),
        (success) => emit(AddCategorySuccessState()));
  }
}
