part of 'update_category_cubit.dart';

@immutable
sealed class UpdateCategoryState {}

final class UpdateCategoryInitial extends UpdateCategoryState {}

final class UpdateCategoryLoading extends UpdateCategoryState {}

final class UpdateCategorySuccess extends UpdateCategoryState {}

final class UpdateCategoryFailure extends UpdateCategoryState {
  final String errMessage;

  UpdateCategoryFailure({required this.errMessage});
}
