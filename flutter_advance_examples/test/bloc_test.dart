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

  group('group test LoginBloc', () {
    blocTest(
      'the first emit {LoginState(loginStatus: LoginStatus.loading)}',
      build: () => LoginBloc(),
      seed: () => const LoginState(),
      act: (bloc) => bloc.add(
        LoginPressed(email: 'admin@gmail.com', password: '123456'),
      ),
      expect: () => [
        const LoginState(loginStatus: LoginStatus.loading),
      ],
    );

    blocTest(
      'emit {LoginState(loginStatus: LoginStatus.loading)} after check Login success emit {LoginState(loginStatus: LoginStatus.success)}',
      build: () => LoginBloc(),
      seed: () => const LoginState(),
      act: (bloc) => bloc.add(
        LoginPressed(email: 'admin@gmail.com', password: '123456'),
      ),
      wait: const Duration(milliseconds: 3000),
      expect: () => [
        const LoginState(loginStatus: LoginStatus.loading),
        const LoginState(loginStatus: LoginStatus.success),
      ],
    );

    blocTest(
      'emit {LoginState(loginStatus: LoginStatus.loading)} after check Login failure emit {LoginState(loginStatus: LoginStatus.failure)}',
      build: () => LoginBloc(),
      seed: () => const LoginState(),
      act: (bloc) => bloc.add(
        LoginPressed(email: 'huy@gmail.com', password: '123456'),
      ),
      wait: const Duration(milliseconds: 3000),
      expect: () => [
        const LoginState(loginStatus: LoginStatus.loading),
        const LoginState(loginStatus: LoginStatus.failure),
      ],
    );
  });

  
}
