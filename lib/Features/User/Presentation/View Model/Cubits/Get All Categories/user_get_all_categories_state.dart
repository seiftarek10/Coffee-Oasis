part of 'user_get_all_categories_cubit.dart';

@immutable
sealed class UserGetAllCategoriesState {}

final class UserGetAllCategoriesInitial extends UserGetAllCategoriesState {}

final class UserGetAllCategoriesLoading extends UserGetAllCategoriesState {}

final class UserGetAllCategoriesSuccess extends UserGetAllCategoriesState {
  final List<CategoryEntity> categories;

  UserGetAllCategoriesSuccess({required this.categories});
}

final class UserGetAllCategoriesFailure extends UserGetAllCategoriesState {
  final String errMssage;

  UserGetAllCategoriesFailure({required this.errMssage});
}
