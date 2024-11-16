import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_cart_items_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'get_cart_items_state.dart';

class GetCartItemsCubit extends BaseCubit<GetCartItemsState> {
  GetCartItemsCubit(this._getCartItemsUseCase) : super(GetCartItemsInitial());
  final GetCartItemsUseCase _getCartItemsUseCase;

  Future<void> getCartItems() async {
    safeEmit(GetCartItemsLoading());
    Either<Failure, List<OrderEntity>> response =
        await _getCartItemsUseCase.execute();

    response.fold(
        (failure) =>
            safeEmit(GetCartItemsFailure(errMessage: failure.errMessage)),
        (data) => safeEmit(GetCartItemsSuccess(cartItems: data)));
  }
}
