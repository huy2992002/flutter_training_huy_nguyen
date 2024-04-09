abstract class SignInEvent {}

class SubmitSignInPressed extends SignInEvent {
  SubmitSignInPressed({required this.email,required this.password}); 
  final String email;
  final String password;
}
