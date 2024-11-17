import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Use%20Case/sign_out_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'sign_out_state.dart';

class SignOutCubit extends BaseCubit<SignOutState> {
  SignOutCubit(this._signOutUseCase) : super(SignOutInitial());
  final SignOutUseCase _signOutUseCase;

  Future<void> singOut() async {
    safeEmit(SignOutLoaing());
    Either<Failure, void> response = await _signOutUseCase.execute();
    response.fold(
        (failure) => safeEmit(SignOutFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(SignOutSuccess()));
  }
}
