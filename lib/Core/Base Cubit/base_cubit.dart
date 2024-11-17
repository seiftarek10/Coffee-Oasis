import 'package:bloc/bloc.dart';

class BaseCubit<State> extends Cubit<State> {
  BaseCubit(super.initialState);

  void safeEmit(State state) {
    if (!isClosed) {
      emit(state);
      return;
    }
  }
}
