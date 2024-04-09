import 'package:dio/dio.dart';
import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ApiClient {
  ApiClient({
    required Dio dio,
    required SupabaseClient supabaseClient,
    required SharedPrefServices prefs,
  }) {
    _dio = dio;
    _supabaseClient = supabaseClient;
    _prefs = prefs;
    _initializeInterceptor();
  }

  late Dio _dio;
  late SupabaseClient _supabaseClient;
  late SharedPrefServices _prefs;

  void _initializeInterceptor() {
    _dio.options.baseUrl = NSConstants.baseUrl;
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final accessToken = await _prefs.getAccessToken();
        options.headers['Authorization'] = 'Bearer $accessToken';
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        return handler.next(response);
      },
      onError: (DioError e, handler) async {
        if (e.response?.statusCode == 401) {
          await _refreshToken();
          final newAccessToken = _prefs.getAccessToken();
          e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
          return handler.resolve(await _dio.fetch(e.requestOptions));
        }
        return handler.next(e);
      },
    ));
  }

  Future<void> _refreshToken() async {
    final response = await _supabaseClient.auth.refreshSession();

    final newAccessToken = response.session?.accessToken;
    final newRefreshToken = response.session?.refreshToken;
    if (newAccessToken != null && newRefreshToken != null) {
      _prefs
        ..saveAccessToken(newRefreshToken)
        ..saveRefreshToken(newRefreshToken);
    }
  }

  // GET METHOD
  Future<Response<dynamic>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } on DioError {
      rethrow;
    }
  }

  // POST METHOD
  Future<Response<dynamic>> post(
    String url, {
    dynamic data,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT METHOD
  Future<Response<dynamic>> put(
    String url, {
    dynamic data,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        url,
        data: data,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE METHOD
  Future<dynamic> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        data: data,
        options: options,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
