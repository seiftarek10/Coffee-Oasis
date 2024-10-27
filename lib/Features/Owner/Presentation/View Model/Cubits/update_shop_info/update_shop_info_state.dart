part of 'update_shop_info_cubit.dart';

@immutable
sealed class UpdateShopInfoState {}

final class UpdateShopInfoInitial extends UpdateShopInfoState {}

final class UpdateShopInfoLoading extends UpdateShopInfoState {}

final class UpdateShopInfoSuccess extends UpdateShopInfoState {}

final class UpdateShopInfoFailure extends UpdateShopInfoState {
  final String errMessage;

  UpdateShopInfoFailure({required this.errMessage});
}
