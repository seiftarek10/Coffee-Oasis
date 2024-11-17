import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class SignOutUseCase extends UseCase<void, void> {
  final AuthRepo _authRepo;

  SignOutUseCase(this._authRepo);
  @override
  Future<Either<Failure, void>> execute({void param}) async {
    return await _authRepo.signOut();
  }
}
