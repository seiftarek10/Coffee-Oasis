import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_user_shop_info_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'user_get_shop_info_state.dart';

class UserGetShopInfoCubit extends BaseCubit<UserGetShopInfoState> {
  UserGetShopInfoCubit(this._userGetShopInfoUseCase)
      : super(UserGetShopInfoInitial());
  final UserGetShopInfoUseCase _userGetShopInfoUseCase;

  Future<void> getShopInfo() async {
    safeEmit(UserGetShopInfoLoading());
    Either<Failure, ShopInfoEntity> response =
        await _userGetShopInfoUseCase.execute();
    response.fold(
        (failure) =>
            safeEmit(UserGetShopInfoFailure(errMessage: failure.errMessage)),
        (info) => safeEmit(UserGetShopInfoSuccss(shopInfo: info)));
  }
}
