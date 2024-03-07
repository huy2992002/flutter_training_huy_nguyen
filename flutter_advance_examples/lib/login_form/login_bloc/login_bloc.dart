import 'dart:async';
import 'package:flutter_advance_examples/login_form/login_bloc/login_event.dart';
import 'package:flutter_advance_examples/login_form/login_bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginPressed>(onLoginSubmitted);
  }

  Future<void> onLoginSubmitted(
      LoginPressed event, Emitter<LoginState> emit) async {
    String email = 'admin@gmail.com';
    String password = '123456';
    emit(state.copyWith(LoginStatus.loading));
    await Future.delayed(const Duration(milliseconds: 2000));

    if (email == event.email && password == event.password) {
      emit(state.copyWith(LoginStatus.success));
    } else {
      emit(state.copyWith(LoginStatus.failure));
    }
  }
}
