import 'package:equatable/equatable.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  const LoginState({this.loginStatus = LoginStatus.initial});

  final LoginStatus loginStatus;

  LoginState copyWith(
    LoginStatus? loginStatus,
  ) {
    return LoginState(loginStatus: loginStatus ?? this.loginStatus);
  }

  @override
  List<Object?> get props => [loginStatus];
}
