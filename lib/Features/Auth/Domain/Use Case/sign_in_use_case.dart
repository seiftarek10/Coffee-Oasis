import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase extends UseCase<void, List<String>> {
  final AuthRepo _authRepo;

  SignInUseCase(this._authRepo);
  @override
  Future<Either<Failure, void>> execute({List<String>? param}) async {
    return await _authRepo.signIn(email: param![0], password: param[1]);
  }
}
