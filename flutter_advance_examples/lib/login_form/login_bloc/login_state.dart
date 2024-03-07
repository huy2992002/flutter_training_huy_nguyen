enum LoginStatus { initial, loading, success, failure }

class LoginState {
  LoginState({this.loginStatus = LoginStatus.initial});

  final LoginStatus loginStatus;

  LoginState copyWith(
    LoginStatus? loginStatus,
  ) {
    return LoginState(loginStatus: loginStatus ?? this.loginStatus);
  }
}
