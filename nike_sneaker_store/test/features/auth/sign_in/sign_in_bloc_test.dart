import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_event.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_state.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';
import 'package:nike_sneaker_store/utils/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../mock_supabase/mock_supabase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('SignInBloc', () {
    late AuthRepository authRepository;
    late SignInBloc signInBloc;

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
      signInBloc = SignInBloc(authRepository);
    });

    test('initial state is SignInState', () {
      expect(signInBloc.state, equals(const SignInState()));
    });

    blocTest(
      'GIVEN user is not sign in '
      'WHEN user implement event sign in '
      'THEN user sign in success',
      // GIVEN
      build: () => signInBloc,
      act: (bloc) {
        String email = 'testSignIn@gmail.com';
        String password = 'password';

        bloc.add(
          SubmitSignInPressed(email: email, password: password),
        );
      },
      expect: () => [
        // WHEN
        const SignInState(status: FormSubmissionStatus.loading),
        // THEN
        const SignInState(status: FormSubmissionStatus.success),
      ],
    );

    blocTest(
      'GIVEN user is not sign in '
      'WHEN user implement event sign in '
      'THEN user sign in failure',
      // GIVEN
      build: () => signInBloc,
      act: (bloc) {
        String email = 'testSignInFaild@gmail.com';
        String password = 'password';

        bloc.add(
          SubmitSignInPressed(email: email, password: password),
        );
      },
      expect: () => [
        // WHEN
        const SignInState(status: FormSubmissionStatus.loading),
        // THEN
        const SignInState(
          status: FormSubmissionStatus.failure,
          message: 'Exception: Invalid login credentials',
        ),
      ],
    );
  });
}
