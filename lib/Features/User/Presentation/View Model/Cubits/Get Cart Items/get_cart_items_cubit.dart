import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_cart_items_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'get_cart_items_state.dart';

class GetCartItemsCubit extends Cubit<GetCartItemsState> {
  GetCartItemsCubit(this._getCartItemsUseCase) : super(GetCartItemsInitial());
  final GetCartItemsUseCase _getCartItemsUseCase;

  Future<void> getCartItems() async {
    emit(GetCartItemsLoading());
    Either<Failure, List<OrderEntity>> response =
        await _getCartItemsUseCase.execute();

    response.fold(
        (failure) => emit(GetCartItemsFailure(errMessage: failure.errMessage)),
        (data) => emit(GetCartItemsSuccess(cartItems: data)));
  }
}
