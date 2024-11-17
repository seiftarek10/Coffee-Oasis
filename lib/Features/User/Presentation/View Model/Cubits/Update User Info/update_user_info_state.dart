part of 'update_user_info_cubit.dart';

@immutable
sealed class UpdateUserInfoState {}

final class UpdateUserInfoInitial extends UpdateUserInfoState {}

final class UpdateUserInfoLoading extends UpdateUserInfoState {}

final class UpdateUserInfoFailure extends UpdateUserInfoState {
  final String errMessage;

  UpdateUserInfoFailure({required this.errMessage});
}

final class UpdateUserInfoSuccess extends UpdateUserInfoState {}
