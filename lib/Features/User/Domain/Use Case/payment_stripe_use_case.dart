import 'package:coffee_oasis/Core/General%20Use%20Case/use_case.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Core/Payment%20Services/Models/payment_intent/payment_intent_input_model.dart';
import 'package:coffee_oasis/Features/User/Domain/Repos/user_repo.dart';
import 'package:dartz/dartz.dart';

class PaymentByStripeUseCase extends UseCase<void, PaymentIntentInputModel> {
  final UserRepo userRepo;

  PaymentByStripeUseCase(this.userRepo);
  @override
  Future<Either<Failure, dynamic>> execute({param}) async {
    return await userRepo.payByStripe(paymentIntentInputModel: param!);
  }
}
