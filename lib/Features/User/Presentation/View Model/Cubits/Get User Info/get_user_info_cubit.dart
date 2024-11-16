import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_user_info_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends BaseCubit<GetUserInfoState> {
  GetUserInfoCubit(this._getUserInfoUseCase) : super(GetUserInfoInitial());

  final GetUserInfoUseCase _getUserInfoUseCase;

  late UserEntity user;

  Future<void> getUserInfo({
    required bool remoteSource,
  }) async {
    safeEmit(GetUserInfoLoading());
    Either<Failure, UserEntity> response =
        await _getUserInfoUseCase.execute(param: remoteSource);

    response.fold((failure) => safeEmit(GetUserInfoFailure()), (data) {
      user = data;
      safeEmit(GetUserInfoSuccess(userEntity: data));
    });
  }
}
