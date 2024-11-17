import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';

sealed class OwnerGetAllCategoriesState {}

class GetAllCategoriesInitial extends OwnerGetAllCategoriesState {}

class GetAllCategoriesLoading extends OwnerGetAllCategoriesState {}

class GetAllCategoriesSuccess extends OwnerGetAllCategoriesState {
  final List<CategoryEntity> categories;

  GetAllCategoriesSuccess({required this.categories});
}

class GetAllCategoriesFailure extends OwnerGetAllCategoriesState {
  final String errMessage;

  GetAllCategoriesFailure({required this.errMessage});
}
