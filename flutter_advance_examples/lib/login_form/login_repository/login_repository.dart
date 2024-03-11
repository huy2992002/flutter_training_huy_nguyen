class LoginRepository {
  final _email = 'admin@gmail.com';
  final _password = '123456';

  Future<bool> canLogin(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (email == _email && password == _password) {
      return true;
    } else {
      return false;
    }
  }
}
