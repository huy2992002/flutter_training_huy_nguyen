import 'dart:convert';

import 'package:flutter_examples/http/album_model.dart';
import 'package:http/http.dart' as http;

class AppServices {
  Future<List<AlbumModel>?> getAlbum() async {
    const url = 'https://jsonplaceholder.typicode.com/albums';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body) as List<dynamic>;

        return data
            .map((e) => AlbumModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return null;
    } catch (e) {
      print('object: $e');
      return null;
    }
  }
}
