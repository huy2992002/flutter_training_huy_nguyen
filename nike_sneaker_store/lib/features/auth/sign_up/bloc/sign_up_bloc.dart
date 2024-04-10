import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/auth/auth_repository.dart';
import 'package:nike_sneaker_store/features/auth/sign_up/bloc/sign_up_event.dart';
import 'package:nike_sneaker_store/features/auth/sign_up/bloc/sign_up_state.dart';
import 'package:nike_sneaker_store/utils/enum.dart';
import 'package:nike_sneaker_store/utils/validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this.authRepository) : super(const SignUpState()) {
    on<SignUpNameChanged>(onNameChanged);
    on<SignUpEmailChanged>(onEmailChanged);
    on<SignUpPasswordChanged>(onPasswordChanged);
    on<SignUpConfirmPasswordChanged>(onConfirmPasswordChanged);
    on<SubmitSignUpPressed>(onSignUpSubmitted);
  }

  final AuthRepository authRepository;

  Future<void> onNameChanged(
    SignUpNameChanged event,
    Emitter<SignUpState> emit,
  ) async {
    bool isValid = isValidSignUp(
      event.context,
      event.name,
      state.email,
      state.password,
      state.confirmPassword,
    );

    emit(state.copyWith(
      name: event.name,
      isValid: isValid,
    ));
  }

  Future<void> onEmailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) async {
    bool isValid = isValidSignUp(
      event.context,
      state.name,
      event.email,
      state.password,
      state.confirmPassword,
    );

    emit(state.copyWith(
      email: event.email,
      isValid: isValid,
    ));
  }

  Future<void> onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) async {
    bool isValid = isValidSignUp(
      event.context,
      state.name,
      state.email,
      event.password,
      state.confirmPassword,
    );

    emit(state.copyWith(
      password: event.password,
      isValid: isValid,
    ));
  }

  Future<void> onConfirmPasswordChanged(
    SignUpConfirmPasswordChanged event,
    Emitter<SignUpState> emit,
  ) async {
    bool isValid = isValidSignUp(
      event.context,
      state.name,
      state.email,
      state.password,
      event.confirmPassword,
    );

    emit(state.copyWith(
      confirmPassword: event.confirmPassword,
      isValid: isValid,
    ));
  }

  Future<void> onSignUpSubmitted(
      SubmitSignUpPressed event, Emitter<SignUpState> emit) async {
    try {
      emit(state.copyWith(status: FormSubmissionStatus.loading));
      await authRepository.signUp(
        name: event.name,
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

  bool isValidSignUp(
    BuildContext context,
    String name,
    String email,
    String password,
    String confirmPassword,
  ) {
    return Validator.validatorRequired(context, name) == null &&
        Validator.validatorEmail(context, email) == null &&
        Validator.validatorPassword(context, password) == null &&
        Validator.validatorConfirmPassword(
                context, confirmPassword, password) ==
            null;
  }
}
