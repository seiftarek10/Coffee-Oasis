import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_all_categoires_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'user_get_all_categories_state.dart';

class UserGetAllCategoriesCubit extends Cubit<UserGetAllCategoriesState> {
  UserGetAllCategoriesCubit(this._getAllCategoriesUseCase)
      : super(UserGetAllCategoriesInitial());

  final UserGetAllCategoiresUseCase _getAllCategoriesUseCase;

  Future<void> getAllCategories() async {
    emit(UserGetAllCategoriesLoading());
    Either<Failure, List<CategoryEntity>> response =
        await _getAllCategoriesUseCase.execute();
    response.fold(
        (failure) =>
            emit(UserGetAllCategoriesFailure(errMssage: failure.errMessage)),
        (data) {
      emit(UserGetAllCategoriesSuccess(categories: data));
    });
  }
}
