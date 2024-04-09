import 'package:flutter/material.dart';

abstract class SignInEvent {}

class SubmitSignInPressed extends SignInEvent {
  SubmitSignInPressed({required this.email, required this.password});
  final String email;
  final String password;
}

class SignInEmailChanged extends SignInEvent {
  SignInEmailChanged(this.context, {required this.email});

  final String email;
  final BuildContext context;
}

class SignInPasswordChanged extends SignInEvent {
  SignInPasswordChanged(this.context, {required this.password});

  final String password;
  final BuildContext context;
}
