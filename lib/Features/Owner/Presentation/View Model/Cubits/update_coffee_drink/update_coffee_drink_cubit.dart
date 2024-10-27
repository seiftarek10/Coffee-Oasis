import 'package:bloc/bloc.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/update_coffee_drink_use_case.dart';
import 'package:meta/meta.dart';

part 'update_coffee_drink_state.dart';

class UpdateCoffeeDrinkCubit extends Cubit<UpdateCoffeeDrinkState> {
  UpdateCoffeeDrinkCubit(this._updateCoffeeDrinkUseCase)
      : super(UpdateCoffeeDrinkInitial());

  final UpdateCoffeeDrinkUseCase _updateCoffeeDrinkUseCase;

  Future<void> updateCoffeeDrink(
      {required String parentDocID,
      required String docID,
      required Map<String, dynamic> body}) async {
    emit(UpdateCoffeeDrinkLoading());
    var response = await _updateCoffeeDrinkUseCase
        .execute(param: [parentDocID, docID, body]);
    response.fold(
        (failure) =>
            emit(UpdateCoffeeDrinkFailure(errMessage: failure.errMessage)),
        (success) => emit(UpdateCoffeeDrinkSuccess()));
  }
}
