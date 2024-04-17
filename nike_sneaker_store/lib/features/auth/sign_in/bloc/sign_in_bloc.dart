import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_event.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_state.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';
import 'package:nike_sneaker_store/utils/enum.dart';
import 'package:nike_sneaker_store/utils/validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this.authRepository) : super(const SignInState()) {
    on<SignInEmailChanged>(onEmailChanged);
    on<SignInPasswordChanged>(onPasswordChanged);
    on<SubmitSignInPressed>(onLoginSubmitted);
  }

  final AuthRepository authRepository;

  Future<void> onEmailChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) async {
    String email = event.email;
    String password = state.password;
    bool isValid = Validator.validatorEmail(event.context, email) == null &&
        Validator.validatorPassword(event.context, password) == null;

    emit(state.copyWith(
      email: email,
      isValid: isValid,
    ));
  }

  Future<void> onPasswordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) async {
    String email = state.email;
    String password = event.password;
    bool isValid = Validator.validatorEmail(event.context, email) == null &&
        Validator.validatorPassword(event.context, password) == null;

    emit(state.copyWith(
      password: password,
      isValid: isValid,
    ));
  }

  Future<void> onLoginSubmitted(
      SubmitSignInPressed event, Emitter<SignInState> emit) async {
    try {
      emit(state.copyWith(status: FormSubmissionStatus.loading));
      await authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      emit(state.copyWith(status: FormSubmissionStatus.success));
    } on AuthException catch (e) {
      emit(state.copyWith(
        status: FormSubmissionStatus.failure,
        message: e.message,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: FormSubmissionStatus.failure,
        message: e.toString(),
      ));
    }
  }
}
