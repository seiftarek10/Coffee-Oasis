import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_all_categories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View Model/Cubits/get_all_categories/get_all_categories_state.dart';

class GetAllCategoriesCubit extends Cubit<GetAllCategoriesState> {
  GetAllCategoriesCubit(this._getAllCategoriesUseCase)
      : super(GetAllCategoriesInitial());

  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  static bool remoteSource = false;
  Future<void> getAllCategories() async {
    emit(GetAllCategoriesLoading());
    Either<Failure, List<CategoryEntity>> response =
        await _getAllCategoriesUseCase.execute(param: remoteSource);
    response.fold(
        (failure) =>
            emit(GetAllCategoriesFailure(errMessage: failure.errMessage)),
        (data) => emit(GetAllCategoriesSuccess(categories: data)));
  }

  void setRemoteSorce() {
    remoteSource = !remoteSource;
  }
}
