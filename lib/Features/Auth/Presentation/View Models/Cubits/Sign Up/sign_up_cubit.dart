import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Use%20Case/sign_up_use_case.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());

  final SignUpUseCase _signUpUseCase;

  Future<void> signUp({required UserEntity userEntity}) async {
    emit(SignUpLoading());
    var response = await _signUpUseCase.execute(param: userEntity);
    response.fold(
        (failure) => emit(SignUpFailure(errMessage: failure.errMessage)),
        (sucsess) => emit(SignUpSuccess()));
  }
}
