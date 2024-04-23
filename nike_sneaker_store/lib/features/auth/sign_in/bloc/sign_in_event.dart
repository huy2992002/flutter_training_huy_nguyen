import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignInEvent extends Equatable {}

class SubmitSignInPressed extends SignInEvent {
  SubmitSignInPressed({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class SignInEmailChanged extends SignInEvent {
  SignInEmailChanged(this.context, {required this.email});

  final String email;
  final BuildContext context;

  @override
  List<Object?> get props => [email, context];
}

class SignInPasswordChanged extends SignInEvent {
  SignInPasswordChanged(this.context, {required this.password});

  final String password;
  final BuildContext context;

  @override
  List<Object?> get props => [password, context];
}
