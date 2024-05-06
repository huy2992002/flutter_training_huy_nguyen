import 'dart:io';
import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';
import 'package:nike_sneaker_store/services/remote/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
  UserRepository({
    required this.supabaseServices,
    required this.apiClient,
  });

  final SupabaseServices supabaseServices;
  final ApiClient apiClient;

  Future<void> updateInformationUser(UserModel user) async {
    try {
      // final url = '${NSConstants.endPointUsers}?uuid=eq.${user.uuid}';
      // apiClient.patch(url, data: user.toJson());
      final query = await supabaseServices.updateData(
          table: NSConstants.tableUsers, values: user.toJson());
      await query.eq('uuid', user.uuid ?? '');
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

  Future<UserModel?> getUser({
    required String userId,
  }) async {
    try {
      final query =
          await supabaseServices.fetchData(table: NSConstants.tableUsers);
      final data = await query.eq('uuid', userId).select();
      if (data.isNotEmpty) {
        return UserModel.fromJson(data.first);
      } else {
        throw const AuthException('User not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
