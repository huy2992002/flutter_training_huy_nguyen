import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:nike_sneaker_store/features/auth/sign_up/view/sign_up_page.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';

class SignUpProvider extends StatelessWidget {
  const SignUpProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(context.read<AuthRepository>()),
      child: const SignUpPage(),
    );
  }
}
