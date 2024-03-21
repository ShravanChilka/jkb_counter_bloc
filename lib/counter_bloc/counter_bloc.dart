import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_bloc/counter_bloc/counter_event.dart';
import 'package:jkb_bloc/counter_bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<CounterEventAdd>(_onCounterEventAdd);
    on<CounterEventSubtract>(_onCounterEventSubract);
  }

  FutureOr<void> _onCounterEventAdd(event, emit) {
    emit(CounterState(state.counter + 1));
  }

  FutureOr<void> _onCounterEventSubract(event, emit) {
    emit(CounterState(state.counter ));
  }
}



