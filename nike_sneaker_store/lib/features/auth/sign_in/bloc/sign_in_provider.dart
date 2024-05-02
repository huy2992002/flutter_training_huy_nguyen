import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/view/sign_in_page.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';

class SignInProvider extends StatelessWidget {
  const SignInProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) => SignInBloc(context.read<AuthRepository>()),
      child: const SignInPage(),
    );
  }
}
