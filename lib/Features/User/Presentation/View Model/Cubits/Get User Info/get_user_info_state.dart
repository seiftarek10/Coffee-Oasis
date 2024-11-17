part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoSuccess extends GetUserInfoState {
  final UserEntity userEntity;

  GetUserInfoSuccess({required this.userEntity});
}

final class GetUserInfoFailure extends GetUserInfoState {}
