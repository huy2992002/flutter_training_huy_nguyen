import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_store/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:nike_sneaker_store/features/auth/sign_up/bloc/sign_up_event.dart';
import 'package:nike_sneaker_store/features/auth/sign_up/bloc/sign_up_state.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';
import 'package:nike_sneaker_store/utils/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/mock_supabase.dart';

void main() {
  group('Sign Up Bloc Test', () {
    late AuthRepository authRepository;
    late SignUpBloc signInBloc;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      authRepository = AuthRepository(
        supabaseClient: MockSupabase(),
        sharedPrefServices: SharedPrefServices(
          sharedPreferences: SharedPreferences.getInstance(),
        ),
        apiClient: ApiClient(
          dio: Dio(),
          supabaseClient: MockSupabase(),
          prefs: SharedPrefServices(
            sharedPreferences: SharedPreferences.getInstance(),
          ),
        ),
      );
      signInBloc = SignUpBloc(authRepository);
    });

    test('initial state is SignUpState', () {
      expect(signInBloc.state, equals(const SignUpState()));
    });

    blocTest(
      'GIVEN user wants to sign up an account '
      'WHEN user implement event sign up '
      'THEN user sign up success',
      // GIVEN
      build: () => signInBloc,
      act: (bloc) {
        String name = 'test';
        String email = 'testNewAccount@gmail.com';
        String password = 'password';

        bloc.add(
          SubmitSignUpPressed(name: name, email: email, password: password),
        );
      },
      expect: () => [
        // WHEN
        const SignUpState(status: FormSubmissionStatus.loading),
        // THEN
        const SignUpState(status: FormSubmissionStatus.success),
      ],
    );

    blocTest(
      'GIVEN user wants to sign up an account '
      'WHEN user implement event sign up '
      'THEN user sign up fail with email already exists',
      // GIVEN
      build: () => signInBloc,
      act: (bloc) {
        String name = 'test';
        String email = 'testSignIn@gmail.com';
        String password = 'password';

        bloc.add(
          SubmitSignUpPressed(name: name, email: email, password: password),
        );
      },
      expect: () => [
        // WHEN
        const SignUpState(status: FormSubmissionStatus.loading),
        // THEN
        const SignUpState(
          status: FormSubmissionStatus.failure,
          message: 'Exception: User already exists',
        ),
      ],
    );
  });
}
