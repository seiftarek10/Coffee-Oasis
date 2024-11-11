import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/handle_fav_coffee_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/is_favorite_item_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'handle_favorite_state.dart';

class HandleFavoriteCubit extends Cubit<HandleFavoriteState> {
  HandleFavoriteCubit(
    this._handleFavCoffeeUseCase,
    this._isFavoriteItemUseCase,
  ) : super(HandleFavoriteInitial());
  final HandleFavCoffeeUseCase _handleFavCoffeeUseCase;
  final IsFavoriteItemUseCase _isFavoriteItemUseCase;

  List<CoffeeEntity> favoritesCoffee = [];
  Future<void> isFavoriteCoffee({required String id}) async {
    emit(HandleFavoriteLoading());
    Either<Failure, bool> response =
        await _isFavoriteItemUseCase.execute(param: id);
    response.fold((failure) => emit(HandleFavoriteFailure(errMessage: '')),
        (isFavorite) => emit(IsExistState(isExist: isFavorite)));
  }

  Future<void> handleFavoriteCoffee(
      {required CoffeeEntity coffee, required bool isExist}) async {
    emit(HandleFavoriteLoading());
    Either<Failure, void> response =
        await _handleFavCoffeeUseCase.execute(param: [coffee, isExist]);
    response.fold(
        (failure) =>
            emit(HandleFavoriteFailure(errMessage: failure.errMessage)),
        (success) {
      if (isExist) {
        emit(DeleteFavoriteSuccess());
      } else {
        emit(AddFavoriteSuccess());
      }
    });
  }
}
