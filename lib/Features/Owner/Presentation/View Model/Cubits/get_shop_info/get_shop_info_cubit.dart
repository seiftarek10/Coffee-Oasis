import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_shop_info_use_case.dart';
import 'package:meta/meta.dart';

part 'get_shop_info_state.dart';

class GetShopInfoCubit extends Cubit<GetShopInfoState> {
  GetShopInfoCubit(this._getShopInfoUseCase) : super(GetShopInfoInitial());

  final GetShopInfoUseCase _getShopInfoUseCase;

  Future<void> getShopInfo() async {
    emit(GetShopInfoLoading());
    var response = await _getShopInfoUseCase.execute();
    response.fold(
        (failure) => emit(GetShopInfoFailure(errMessage: failure.errMessage)),
        (info) => emit(GetShopInfoSuccess(shopInfoEntity: info)));
  }
}
