part of 'get_shop_info_cubit.dart';

@immutable
sealed class OwnerGetShopInfoState {}

final class GetShopInfoInitial extends OwnerGetShopInfoState {}

final class OwenrGetShopInfoLoading extends OwnerGetShopInfoState {}

final class OwnerGetShopInfoFailure extends OwnerGetShopInfoState {
  final String errMessage;

  OwnerGetShopInfoFailure({required this.errMessage});
}

final class OwenrGetShopInfoSuccess extends OwnerGetShopInfoState {
  final ShopInfoEntity shopInfoEntity;

  OwenrGetShopInfoSuccess({required this.shopInfoEntity});
}
