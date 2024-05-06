import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  SupabaseServices({required this.supabaseClient});

  final SupabaseClient supabaseClient;

  Future<PostgrestFilterBuilder<dynamic>> _safeSupabaseRequest(
      PostgrestFilterBuilder<dynamic> Function() request) async {
    try {
      return request();
    } catch (e) {
      if (e is PostgrestException && e.code == '401') {
        // Refresh the session
        await supabaseClient.auth
            .refreshSession()
            .onError((error, stackTrace) => throw e);
        // Retry the request
        return request();
      } else {
        // It's not a 401 error, rethrow it
        rethrow;
      }
    }
  }

  Future<PostgrestFilterBuilder<dynamic>> fetchData({
    required String table,
    String? select,
  }) {
    return _safeSupabaseRequest(
        () => supabaseClient.from(table).select(select ?? '*'));
  }

  Future<PostgrestFilterBuilder<dynamic>> updateData({
    required String table,
    required Map<String, dynamic> values,
  }) {
    return _safeSupabaseRequest(
        () => supabaseClient.from(table).update(values));
  }

  Future<PostgrestFilterBuilder<dynamic>> insertData({
    required String table,
    required Map<String, dynamic> values,
  }) {
    return _safeSupabaseRequest(
        () => supabaseClient.from(table).insert(values));
  }
}
