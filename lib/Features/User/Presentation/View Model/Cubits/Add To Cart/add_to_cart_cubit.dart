import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/cart_item_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/add_to_cart_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this._addToCartUseCase) : super(AddToCartInitial());

  final AddToCartUseCase _addToCartUseCase;

  Future<void> addToCart({required CartItemEntity cartItem}) async {
    emit(AddToCartLoading());
    Either<Failure, void> response =
        await _addToCartUseCase.execute(param: cartItem);
    response.fold(
        (failure) => emit(AddToCartFailure(errMessage: failure.errMessage)),
        (success) => emit(AddToCartSuccess()));
  }
}
