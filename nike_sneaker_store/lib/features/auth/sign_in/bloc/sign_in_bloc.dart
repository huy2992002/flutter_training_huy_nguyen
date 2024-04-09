import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/auth/auth_repository.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_event.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this.authRepository) : super(SignInStarted()) {
    on<SubmitSignInPressed>(onLoginSubmitted);
  }

  final AuthRepository authRepository;

  Future<void> onLoginSubmitted(
      SubmitSignInPressed event, Emitter<SignInState> emit) async {
    try {
      emit(SignInLoading());
      await authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      emit(SignInSuccess());
    } on AuthException catch (e) {
      print('object');
      emit(SignInFailed(message: e.message));
    } catch (e) {
      emit(
        SignInFailed(message: e.toString()),
      );
    }
  }
}
