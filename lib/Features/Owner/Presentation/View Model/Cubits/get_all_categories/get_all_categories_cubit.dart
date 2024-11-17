import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_all_categories.dart';
import 'package:dartz/dartz.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View Model/Cubits/get_all_categories/get_all_categories_state.dart';

class OwnerGetAllCategoriesCubit extends BaseCubit<OwnerGetAllCategoriesState> {
  OwnerGetAllCategoriesCubit(this._getAllCategoriesUseCase)
      : super(GetAllCategoriesInitial());

  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  Future<void> getAllCategories({bool? remoteSource}) async {
    safeEmit(GetAllCategoriesLoading());
    Either<Failure, List<CategoryEntity>> response =
        await _getAllCategoriesUseCase.execute(param: remoteSource);
    response.fold(
        (failure) =>
            safeEmit(GetAllCategoriesFailure(errMessage: failure.errMessage)),
        (data) => safeEmit(GetAllCategoriesSuccess(categories: data)));
  }
}
