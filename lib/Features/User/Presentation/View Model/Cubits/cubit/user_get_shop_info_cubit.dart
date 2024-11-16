import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_user_shop_info_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'user_get_shop_info_state.dart';

class UserGetShopInfoCubit extends Cubit<UserGetShopInfoState> {
  UserGetShopInfoCubit(this._userGetShopInfoUseCase)
      : super(UserGetShopInfoInitial());
  final UserGetShopInfoUseCase _userGetShopInfoUseCase;

  Future<void> getShopInfo() async {
    emit(UserGetShopInfoLoading());
    Either<Failure, ShopInfoEntity> response =
        await _userGetShopInfoUseCase.execute();
    response.fold(
        (failure) =>
            emit(UserGetShopInfoFailure(errMessage: failure.errMessage)),
        (info) => emit(UserGetShopInfoSuccss(shopInfo: info)));
  }
}
