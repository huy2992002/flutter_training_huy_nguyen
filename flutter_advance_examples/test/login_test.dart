import 'package:flutter_advance_examples/login_form/login_repository/login_repository.dart';
import 'package:test/test.dart';

void main() {
  group('Test login', () {
    LoginRepository loginRepository = LoginRepository();
    test('Login success', () async {
      bool isLoginSuccess = await loginRepository.canLogin(
        email: 'admin@gmail.com',
        password: '123456',
      );
      expect(isLoginSuccess, true);
    });

    test('Login failure', () async {
      bool isLoginSuccess = await loginRepository.canLogin(
        email: 'admin@gmail.com',
        password: '123',
      );
      expect(isLoginSuccess, false);
    });
  });
}
