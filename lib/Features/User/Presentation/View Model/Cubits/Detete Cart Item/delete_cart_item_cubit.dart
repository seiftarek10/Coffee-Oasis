import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/delete_cart_item.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'delete_cart_item_state.dart';

class DeleteCartItemCubit extends BaseCubit<DeleteCartItemState> {
  DeleteCartItemCubit(this._deleteCartItemUseCase)
      : super(DeleteCartItemInitial());

  final DeleteCartItemUseCase _deleteCartItemUseCase;

  Future<void> deleteCartItem({required String id}) async {
    safeEmit(DeleteCartItemLoading());
    Either<Failure, void> response =
        await _deleteCartItemUseCase.execute(param: id);
    response.fold(
        (failure) =>
            safeEmit(DeleteCartItemFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(DeleteCartItemSuccess()));
  }
}
