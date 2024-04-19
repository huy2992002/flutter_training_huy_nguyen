import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  AuthRepository({
    required this.supabaseClient,
    required this.sharedPrefServices,
    required this.apiClient,
  });

  final SupabaseClient supabaseClient;
  final SharedPrefServices sharedPrefServices;
  final ApiClient apiClient;

  Future<User> signIn({required String email, required String password}) async {
    try {
      final authResponse = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      String? accessToken = authResponse.session?.accessToken;
      String? refreshToken = authResponse.session?.refreshToken;
      if (accessToken != null && refreshToken != null) {
        sharedPrefServices
          ..saveAccessToken(accessToken)
          ..saveRefreshToken(refreshToken);
      }
      if (authResponse.user != null) {
        return authResponse.user!;
      } else {
        throw Exception('Dont find User');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'username': email},
      );
      if (authResponse.user != null) {
        UserModel user = UserModel(
          uuid: authResponse.user?.id,
          name: name,
          email: email,
        );
        apiClient.post(
          NSConstants.endPointUsers,
          data: user.toJson(),
        );
        return authResponse.user!;
      } else {
        throw Exception('Dont find User');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> getUser({
    required String userId,
  }) async {
    try {
      final url = '${NSConstants.endPointUsers}?uuid=eq.$userId';
      final response = await apiClient.get(url);
      final data = response.data as List<dynamic>;
      if (data.isNotEmpty && data[0] is Map<String, dynamic>) {
        return UserModel.fromJson(data[0] as Map<String, dynamic>);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUsers(UserModel user) async {
    try {
      final url = '${NSConstants.endPointUsers}?uuid=eq.${user.uuid}';
      apiClient.patch(url, data: user.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
