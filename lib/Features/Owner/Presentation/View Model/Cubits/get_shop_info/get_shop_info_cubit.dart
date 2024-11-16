import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_shop_info_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'get_shop_info_state.dart';

class OwnerGetShopInfoCubit extends Cubit<OwnerGetShopInfoState> {
  OwnerGetShopInfoCubit(this._getShopInfoUseCase) : super(GetShopInfoInitial());

  final OwnerGetShopInfoUseCase _getShopInfoUseCase;

  Future<void> getShopInfo({required bool remoteSource}) async {
    emit(OwenrGetShopInfoLoading());
    Either<Failure, ShopInfoEntity> response =
        await _getShopInfoUseCase.execute(param: remoteSource);
    response.fold(
        (failure) =>
            emit(OwnerGetShopInfoFailure(errMessage: failure.errMessage)),
        (info) => emit(OwenrGetShopInfoSuccess(shopInfoEntity: info)));
  }
}
