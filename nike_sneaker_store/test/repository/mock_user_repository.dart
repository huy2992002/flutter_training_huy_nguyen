import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';

import '../services/mock_api_client.dart';

class MockUserRepository extends Fake implements UserRepository {
  @override
  ApiClient get apiClient => MockApiClient();

  @override
  Future<void> updateInformationUser(UserModel user) async {
    return;
  }

  @override
  Future<String?> uploadAvatar(File? file) async {
    return '';
  }
}