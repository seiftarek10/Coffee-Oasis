part of 'user_get_shop_info_cubit.dart';

@immutable
sealed class UserGetShopInfoState {}

final class UserGetShopInfoInitial extends UserGetShopInfoState {}

final class UserGetShopInfoLoading extends UserGetShopInfoState {}

final class UserGetShopInfoSuccss extends UserGetShopInfoState {
  final ShopInfoEntity shopInfo;

  UserGetShopInfoSuccss({required this.shopInfo});
}

final class UserGetShopInfoFailure extends UserGetShopInfoState {
  final String errMessage;

  UserGetShopInfoFailure({required this.errMessage});
}
