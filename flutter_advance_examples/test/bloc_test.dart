import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_advance_examples/counter/counter_bloc/counter_bloc.dart';
import 'package:flutter_advance_examples/counter/counter_event/counter_event.dart';
import 'package:flutter_advance_examples/login_form/login_bloc/login_bloc.dart';
import 'package:flutter_advance_examples/login_form/login_bloc/login_event.dart';
import 'package:flutter_advance_examples/login_form/login_bloc/login_state.dart';
import 'package:test/test.dart';

void main() {
  group('group test CounterBloc', () {
    blocTest(
      'emit [] when nothing is added',
      build: () => CounterBloc(),
      expect: () => [],
    );
    blocTest(
      'emit [1] when add event CounterIncrement',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(CounterIncrement()),
      expect: () => [1],
    );

    blocTest(
      'emit [5] when add event CounterIncrement with initValue is 4',
      build: () => CounterBloc(),
      seed: () => 4,
      act: (bloc) => bloc.add(CounterIncrement()),
      expect: () => [5],
    );

    blocTest(
      'emit [9] when add event CounterDecrement with initValue is 10',
      build: () => CounterBloc(),
      seed: () => 10,
      act: (bloc) => bloc.add(CounterDecrement()),
      expect: () => [9],
    );
  });

}
