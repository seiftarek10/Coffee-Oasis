import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_favorite_coffee.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'get_favorites_coffee_state.dart';

class GetFavoritesCoffeeCubit extends Cubit<GetFavoritesCoffeeState> {
  GetFavoritesCoffeeCubit(this._getFavoriteCoffeeUseCase)
      : super(GetFavoritesCoffeeInitial());
  final GetFavoriteCoffeeUseCase _getFavoriteCoffeeUseCase;

  Future<void> getFavCoffee() async {
    emit(GetFavoritesCoffeeLoading());
    Either<Failure, List<CoffeeEntity>> response =
        await _getFavoriteCoffeeUseCase.execute();
    response.fold(
        (failure) =>
            emit(GetFavoritesCoffeeFailure(errMeassage: failure.errMessage)),
        (data) => emit(GetFavoritesCoffeeSuccess(favCoffee: data)));
  }
}
