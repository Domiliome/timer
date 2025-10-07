import "package:flutter_bloc/flutter_bloc.dart";

sealed class CounterDEvent {}

final class CounterPressed extends CounterDEvent {
  final int num;
  CounterPressed(this.num);
}

class CounterBloc extends Bloc<CounterDEvent, int> {
  CounterBloc(int initialState) : super(initialState) {
    on<CounterPressed>((event, emit) {
      final newState = state + event.num;
      emit(newState);
    });
  }
}
