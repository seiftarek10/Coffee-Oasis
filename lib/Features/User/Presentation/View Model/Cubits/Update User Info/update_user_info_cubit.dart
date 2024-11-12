import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/update_user_info_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'update_user_info_state.dart';

class UpdateUserInfoCubit extends Cubit<UpdateUserInfoState> {
  UpdateUserInfoCubit(this._updateUserInfoUseCase)
      : super(UpdateUserInfoInitial());

  final UpdateUserInfoUseCase _updateUserInfoUseCase;

  Future<void> updateUserInfo({required Map<String, dynamic> body}) async {
    emit(UpdateUserInfoLoading());
    Either<Failure, void> response =
        await _updateUserInfoUseCase.execute(param: body);
    response.fold(
        (failure) =>
            emit(UpdateUserInfoFailure(errMessage: failure.errMessage)),
        (success) => emit(UpdateUserInfoSuccess()));
  }
}
