import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Use%20Case/sign_in_use_case.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInUseCase) : super(SignInInitial());

  final SignInUseCase _signInUseCase;

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    var response = await _signInUseCase.execute(param: [email, password]);
    response.fold(
        (failure) => emit(SignInFailure(errMessage: failure.errMessage)),
        (success) => emit(SignInSuccess()));
  }
}
