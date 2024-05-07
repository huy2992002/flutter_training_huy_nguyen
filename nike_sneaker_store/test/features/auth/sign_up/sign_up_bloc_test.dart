import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_store/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:nike_sneaker_store/features/auth/sign_up/bloc/sign_up_event.dart';
import 'package:nike_sneaker_store/features/auth/sign_up/bloc/sign_up_state.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:nike_sneaker_store/services/remote/supabase_services.dart';
import 'package:nike_sneaker_store/utils/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/mock_supabase.dart';

void main() {
  group('Sign Up Bloc Test', () {
    late AuthRepository authRepository;
    late SignUpBloc signUpBloc;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      authRepository = AuthRepository(
        supabaseServices: SupabaseServices(supabaseClient: MockSupabase()),
        sharedPrefServices: SharedPrefServices(
          sharedPreferences: SharedPreferences.getInstance(),
        ),
      );
      signUpBloc = SignUpBloc(authRepository);
    });

    test('initial state is SignUpState', () {
      expect(signUpBloc.state, equals(const SignUpState()));
    });

    blocTest(
      'GIVEN user wants to sign up an account '
      'WHEN user implement event sign up '
      'THEN user sign up success',
      // GIVEN
      build: () => signUpBloc,
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
      build: () => signUpBloc,
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
          message: '',
        ),
      ],
    );
  });
}
