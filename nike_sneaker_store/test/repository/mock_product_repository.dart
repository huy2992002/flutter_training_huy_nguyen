import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_store/models/notification_model.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';

import '../utils/mock_data.dart';

class MockProductRepository extends Fake implements ProductRepository {
  @override
  Future<List<ProductModel>?> getProducts({int maxLength = 2}) async {
    return MockData.mockProducts;
  }

  @override
  Future<List<String>?> getIdProductFavorites(String? userId) async {
    if (userId != null) {
      return [MockData.mockProduct.uuid ?? ''];
    } else {
      throw Exception('An error occurred, please check UserId');
    }
  }

  @override
  Future<List<ProductModel>?> getIdProductCart(String? userId) async {
    if (userId != null) {
      return MockData.mockProducts;
    } else {
      throw Exception('An error occurred, please check UserId');
    }
  }

  @override
  Future<List<ProductModel>?> fetchProductsByName(String name) async {
    return MockData.mockProducts;
  }

  @override
  Future<List<NotificationModel>?> fetchNotifications(String? userId) async {
    if (userId != null) {
      return MockData.mockNotifications;
    } else {
      throw Exception('An error occurred, please check UserId');
    }
  }
}
