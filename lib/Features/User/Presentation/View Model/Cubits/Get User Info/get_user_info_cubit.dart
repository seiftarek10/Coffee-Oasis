import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_user_info_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit(this._getUserInfoUseCase) : super(GetUserInfoInitial());

  final GetUserInfoUseCase _getUserInfoUseCase;

  Future<void> getUserInfo({
    required bool remoteSource,
  }) async {
    emit(GetUserInfoLoading());
    Either<Failure, UserEntity> response =
        await _getUserInfoUseCase.execute(param: remoteSource);

    response.fold((failure) => emit(GetUserInfoFailure()),
        (data) => emit(GetUserInfoSuccess(userEntity: data)));
  }
}
