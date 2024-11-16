import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/handle_fav_coffee_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/is_favorite_item_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'handle_favorite_state.dart';

class HandleFavoriteCubit extends BaseCubit<HandleFavoriteState> {
  HandleFavoriteCubit(
    this._handleFavCoffeeUseCase,
    this._isFavoriteItemUseCase,
  ) : super(HandleFavoriteInitial());
  final HandleFavCoffeeUseCase _handleFavCoffeeUseCase;
  final IsFavoriteItemUseCase _isFavoriteItemUseCase;

  List<CoffeeEntity> favoritesCoffee = [];
  Future<void> isFavoriteCoffee({required String id}) async {
    safeEmit(HandleFavoriteLoading());
    Either<Failure, bool> response =
        await _isFavoriteItemUseCase.execute(param: id);
    response.fold((failure) {
      if (!isClosed) {
        safeEmit(HandleFavoriteFailure(errMessage: ''));
      }
    }, (isFavorite) {
      if (!isClosed) {
        safeEmit(IsExistState(isExist: isFavorite));
      }
    });
  }

  void initialFavCoffee() {
    safeEmit(IsExistState(isExist: true));
  }

  Future<void> handleFavoriteCoffee(
      {required CoffeeEntity coffee, required bool isExist}) async {
    safeEmit(HandleFavoriteLoading());
    Either<Failure, void> response =
        await _handleFavCoffeeUseCase.execute(param: [coffee, isExist]);
    response.fold((failure) {
      if (!isClosed) {
        safeEmit(HandleFavoriteFailure(errMessage: failure.errMessage));
      }
    }, (success) {
      if (isExist) {
        if (!isClosed) {
          safeEmit(DeleteFavoriteSuccess());
        }
      } else {
        if (!isClosed) {
          safeEmit(AddFavoriteSuccess());
        }
      }
    });
  }
}
