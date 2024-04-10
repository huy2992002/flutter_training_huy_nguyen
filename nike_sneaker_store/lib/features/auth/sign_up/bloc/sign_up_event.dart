import 'package:flutter/material.dart';

abstract class SignUpEvent {}

class SubmitSignUpPressed extends SignUpEvent {
  SubmitSignUpPressed(
      {required this.name, required this.email, required this.password});
  final String name;
  final String email;
  final String password;
}

class SignUpNameChanged extends SignUpEvent {
  SignUpNameChanged(this.context, {required this.name});

  final String name;
  final BuildContext context;
}

class SignUpEmailChanged extends SignUpEvent {
  SignUpEmailChanged(this.context, {required this.email});

  final String email;
  final BuildContext context;
}

class SignUpPasswordChanged extends SignUpEvent {
  SignUpPasswordChanged(this.context, {required this.password});

  final String password;
  final BuildContext context;
}

class SignUpConfirmPasswordChanged extends SignUpEvent {
  SignUpConfirmPasswordChanged(this.context, {required this.confirmPassword});

  final String confirmPassword;
  final BuildContext context;
}
