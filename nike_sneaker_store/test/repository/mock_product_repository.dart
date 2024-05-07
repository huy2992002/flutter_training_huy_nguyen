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
    return [MockData.mockProduct.uuid ?? ''];
  }

  @override
  Future<List<ProductModel>?> getIdProductCart(String? userId) async {
    return MockData.mockProducts;
  }

  @override
  Future<List<ProductModel>?> fetchProductsByName(String name) async {
    return MockData.mockProducts;
  }

  @override
  Future<List<NotificationModel>?> fetchNotifications(String? userId) async {
    return MockData.mockNotifications;
  }
}
