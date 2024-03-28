import 'package:dio/dio.dart';
import 'package:flutter_advance_examples/posts/constants/app_constants.dart';

class ApiClient {
  final Dio _dio = Dio();

  ApiClient() {
    _dio.options.baseUrl = AppConstants.baseUrl;
  }

  Future<Response> getPosts() async {
    try {
      Response response = await _dio.get(AppConstants.endPointPosts);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
