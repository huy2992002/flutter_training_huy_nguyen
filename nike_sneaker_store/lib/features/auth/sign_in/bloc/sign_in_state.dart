abstract class SignInState {}

final class SignInStarted extends SignInState {}

final class SignInSuccess extends SignInState {}

final class SignInFailed extends SignInState {
  SignInFailed({required this.message});
  final String message;
}

final class SignInLoading extends SignInState {}
