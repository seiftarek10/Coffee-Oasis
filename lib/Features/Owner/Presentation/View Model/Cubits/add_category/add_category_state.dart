sealed class AddCategoryState {}

class AddCategoryInitialState extends AddCategoryState {}

class AddCategoryLoadingState extends AddCategoryState {}

class AddCategorySuccessState extends AddCategoryState {}

class AddCategoryFailureState extends AddCategoryState {
  final String errMessage;

  AddCategoryFailureState({required this.errMessage});
}
