part of 'get_shop_info_cubit.dart';

@immutable
sealed class GetShopInfoState {}

final class GetShopInfoInitial extends GetShopInfoState {}

final class GetShopInfoLoading extends GetShopInfoState {}

final class GetShopInfoFailure extends GetShopInfoState {
  final String errMessage;

  GetShopInfoFailure({required this.errMessage});
}

final class GetShopInfoSuccess extends GetShopInfoState {
  final ShopInfoEntity shopInfoEntity;

  GetShopInfoSuccess({required this.shopInfoEntity});
}
