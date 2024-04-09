import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  AuthRepository({required this.supabaseClient});

  final SupabaseClient supabaseClient;

  Future<User?> signIn(
      {required String email, required String password}) async {
    try {
      final authResponse = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return authResponse.user;
    } catch (e) {
      rethrow;
    }
  }
}
