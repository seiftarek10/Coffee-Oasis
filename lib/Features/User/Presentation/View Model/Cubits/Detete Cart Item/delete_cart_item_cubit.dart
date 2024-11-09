import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/delete_cart_item.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'delete_cart_item_state.dart';

class DeleteCartItemCubit extends Cubit<DeleteCartItemState> {
  DeleteCartItemCubit(this._deleteCartItemUseCase)
      : super(DeleteCartItemInitial());

  final DeleteCartItemUseCase _deleteCartItemUseCase;

  Future<void> deleteCartItem({required String id}) async {
    emit(DeleteCartItemLoading());
    Either<Failure, void> response =
        await _deleteCartItemUseCase.execute(param: id);
    response.fold(
        (failure) =>
            emit(DeleteCartItemFailure(errMessage: failure.errMessage)),
        (success) => emit(DeleteCartItemSuccess()));
  }
}
