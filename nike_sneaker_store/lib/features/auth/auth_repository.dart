import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  AuthRepository({
    required this.supabaseClient,
    required this.sharedPrefServices,
  });

  final SupabaseClient supabaseClient;
  final SharedPrefServices sharedPrefServices;

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
        print('object yes');
        return authResponse.user!;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
}
