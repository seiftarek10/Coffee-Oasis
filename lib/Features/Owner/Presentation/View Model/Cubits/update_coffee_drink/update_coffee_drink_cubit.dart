import 'package:coffee_oasis/Core/Base%20Cubit/base_cubit.dart';
import 'package:coffee_oasis/Core/NetWork/failure.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/update_coffee_drink_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'update_coffee_drink_state.dart';

class UpdateCoffeeDrinkCubit extends BaseCubit<UpdateCoffeeDrinkState> {
  UpdateCoffeeDrinkCubit(this._updateCoffeeDrinkUseCase)
      : super(UpdateCoffeeDrinkInitial());

  final UpdateCoffeeDrinkUseCase _updateCoffeeDrinkUseCase;

  Future<void> updateCoffeeDrink(
      {required String parentDocID,
      required String docID,
      required Map<String, dynamic> body}) async {
    safeEmit(UpdateCoffeeDrinkLoading());
    Either<Failure, void> response = await _updateCoffeeDrinkUseCase
        .execute(param: [parentDocID, docID, body]);
    response.fold(
        (failure) =>
            safeEmit(UpdateCoffeeDrinkFailure(errMessage: failure.errMessage)),
        (success) => safeEmit(UpdateCoffeeDrinkSuccess()));
  }
}
