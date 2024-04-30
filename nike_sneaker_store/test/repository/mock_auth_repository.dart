import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';

import '../services/mock_api_client.dart';

class MockAuthRepository extends Fake implements AuthRepository {
  @override
  ApiClient get apiClient => MockApiClient();
}
