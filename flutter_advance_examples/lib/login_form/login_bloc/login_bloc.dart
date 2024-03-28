import 'dart:async';
import 'package:flutter_advance_examples/login_form/login_bloc/login_event.dart';
import 'package:flutter_advance_examples/login_form/login_bloc/login_state.dart';
import 'package:flutter_advance_examples/login_form/login_repository/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginPressed>(onLoginSubmitted);
  }

  LoginRepository loginRepository = LoginRepository();

  Future<void> onLoginSubmitted(
      LoginPressed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(LoginStatus.loading));
    bool canLogin = await loginRepository.canLogin(
        email: event.email, password: event.password);
    if (canLogin) {
      emit(state.copyWith(LoginStatus.success));
    } else {
      emit(state.copyWith(LoginStatus.failure));
    }
  }
}
