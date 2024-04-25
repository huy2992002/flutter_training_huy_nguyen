import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';

import '../services/mock_api_client.dart';
import '../utils/mock_data.dart';

class MockAuthRepository extends Fake implements AuthRepository {
  @override
  ApiClient get apiClient => MockApiClient();

  @override
  Future<UserModel?> getUser({required String userId}) async {
    return MockData.mockUser;
  }
}
