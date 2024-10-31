import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/update_shop_info_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'update_shop_info_state.dart';

class UpdateShopInfoCubit extends Cubit<UpdateShopInfoState> {
  UpdateShopInfoCubit(this._updateShopInfoUseCase)
      : super(UpdateShopInfoInitial());

  final UpdateShopInfoUseCase _updateShopInfoUseCase;

  Future<void> updateShopInfo({required Map<String, dynamic> body}) async {
    emit(UpdateShopInfoLoading());
    Either<Failure, void> response =
        await _updateShopInfoUseCase.execute(param: body);
    response.fold(
        (failure) =>
            emit(UpdateShopInfoFailure(errMessage: failure.errMessage)),
        (success) => emit(UpdateShopInfoSuccess()));
  }
}
