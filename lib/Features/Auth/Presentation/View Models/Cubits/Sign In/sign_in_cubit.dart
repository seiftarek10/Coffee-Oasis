import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Use%20Case/sign_in_use_case.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends BaseCubit<SignInState> {
  SignInCubit(this._signInUseCase) : super(SignInInitial());

  final SignInUseCase _signInUseCase;

  Future<void> signIn({required String email, required String password}) async {
    safeEmit(SignInLoading());
    var response = await _signInUseCase.execute(param: [email, password]);
    response.fold(
        (failure) => safeEmit(SignInFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(SignInSuccess()));
  }
}
