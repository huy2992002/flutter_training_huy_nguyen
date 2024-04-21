import 'dart:io';

import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';

class UserRepository {
  UserRepository({
    required this.apiClient,
  });
  final ApiClient apiClient;

  Future<void> updateInformationUser(UserModel user) async {
    try {
      final url = '${NSConstants.endPointUsers}?uuid=eq.${user.uuid}';
      apiClient.patch(url, data: user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> uploadAvatar(File? file) async {
    try {
      return file == null ? null : await apiClient.uploadImage(file);
    } catch (e) {
      rethrow;
    }
  }
}
