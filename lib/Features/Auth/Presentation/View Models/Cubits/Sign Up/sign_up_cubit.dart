import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Use%20Case/sign_up_use_case.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends BaseCubit<SignUpState> {
  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());

  final SignUpUseCase _signUpUseCase;

  Future<void> signUp({required UserEntity userEntity}) async {
    safeEmit(SignUpLoading());
    var response = await _signUpUseCase.execute(param: userEntity);
    response.fold(
        (failure) => safeEmit(SignUpFailure(errMessage: failure.errMessage)),
        (sucsess) => safeEmit(SignUpSuccess()));
  }
}
