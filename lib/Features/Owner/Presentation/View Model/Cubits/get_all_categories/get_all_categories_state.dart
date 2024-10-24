import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';

sealed class GetAllCategoriesState {}

class GetAllCategoriesInitial extends GetAllCategoriesState {}

class GetAllCategoriesLoading extends GetAllCategoriesState {}

class GetAllCategoriesSuccess extends GetAllCategoriesState {
  final List<CategoryEntity> categories;

  GetAllCategoriesSuccess({required this.categories});
}

class GetAllCategoriesFailure extends GetAllCategoriesState {
  final String errMessage;

  GetAllCategoriesFailure({required this.errMessage});
}
