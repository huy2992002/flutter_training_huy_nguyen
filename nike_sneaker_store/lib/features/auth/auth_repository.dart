import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';
import 'package:nike_sneaker_store/utils/maths.dart';
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
        throw Exception();
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
          uuid: Maths.randomUUid(length: 10),
          name: name,
          email: email,
        );  
        apiClient.post(
          NSConstants.endPointUsers,
          data: user.toJson(),
        );
        return authResponse.user!;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
