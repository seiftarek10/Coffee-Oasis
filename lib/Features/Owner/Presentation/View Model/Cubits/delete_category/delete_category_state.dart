part of 'delete_category_cubit.dart';

@immutable
sealed class DeleteCategoryState {}

final class DeleteCategoryInitial extends DeleteCategoryState {}

final class DeleteCategoryLoading extends DeleteCategoryState {}

final class DeleteCategorySuccess extends DeleteCategoryState {}

final class DeleteCategoryFailure extends DeleteCategoryState {
  final String errMessage;

  DeleteCategoryFailure({required this.errMessage});
}
