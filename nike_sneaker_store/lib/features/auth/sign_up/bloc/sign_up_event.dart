import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignUpEvent extends Equatable {}

class SubmitSignUpPressed extends SignUpEvent {
  SubmitSignUpPressed(
      {required this.name, required this.email, required this.password});
  final String name;
  final String email;
  final String password;

  @override
  List<Object?> get props => [name, email, password];
}

class SignUpNameChanged extends SignUpEvent {
  SignUpNameChanged(this.context, {required this.name});

  final String name;
  final BuildContext context;

  @override
  List<Object?> get props => [name, context];
}

class SignUpEmailChanged extends SignUpEvent {
  SignUpEmailChanged(this.context, {required this.email});

  final String email;
  final BuildContext context;

  @override
  List<Object?> get props => [email, context];
}

class SignUpPasswordChanged extends SignUpEvent {
  SignUpPasswordChanged(this.context, {required this.password});

  final String password;
  final BuildContext context;

  @override
  List<Object?> get props => [password, context];
}

class SignUpConfirmPasswordChanged extends SignUpEvent {
  SignUpConfirmPasswordChanged(this.context, {required this.confirmPassword});

  final String confirmPassword;
  final BuildContext context;

  @override
  List<Object?> get props => [confirmPassword, context];
}
