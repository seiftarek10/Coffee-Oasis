import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_favorite_coffee.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'get_favorites_coffee_state.dart';

class GetFavoritesCoffeeCubit extends BaseCubit<GetFavoritesCoffeeState> {
  GetFavoritesCoffeeCubit(this._getFavoriteCoffeeUseCase)
      : super(GetFavoritesCoffeeInitial());
  final GetFavoriteCoffeeUseCase _getFavoriteCoffeeUseCase;

  Future<void> getFavCoffee() async {
    safeEmit(GetFavoritesCoffeeLoading());
    Either<Failure, List<CoffeeEntity>> response =
        await _getFavoriteCoffeeUseCase.execute();
    response.fold(
        (failure) => safeEmit(
            GetFavoritesCoffeeFailure(errMeassage: failure.errMessage)),
        (data) => safeEmit(GetFavoritesCoffeeSuccess(favCoffee: data)));
  }
}
