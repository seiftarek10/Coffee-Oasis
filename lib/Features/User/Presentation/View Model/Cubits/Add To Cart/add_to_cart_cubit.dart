import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/add_to_cart_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends BaseCubit<AddToCartState> {
  AddToCartCubit(this._addToCartUseCase) : super(AddToCartInitial());

  final AddToCartUseCase _addToCartUseCase;

  Future<void> addToCart({required OrderItemEntity cartItem}) async {
    emit(AddToCartLoading());
    Either<Failure, void> response =
        await _addToCartUseCase.execute(param: cartItem);
    response.fold(
        (failure) => safeEmit(AddToCartFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(AddToCartSuccess()));
  }
}
