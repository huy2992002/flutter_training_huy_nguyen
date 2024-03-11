import 'package:dio/dio.dart';
import 'package:flutter_advance_examples/posts/api/api_client.dart';
import 'package:flutter_advance_examples/posts/models/post_model.dart';

class PostRepository {
  ApiClient apiClient = ApiClient();

  Future<List<PostModel>> fetchListPost() async {
    try {
      Response response = await apiClient.getPosts();

      List<dynamic> data = response.data;
      return data
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
