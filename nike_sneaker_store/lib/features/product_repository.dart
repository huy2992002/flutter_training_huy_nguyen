import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';

class ProductRepository {
  ProductRepository({required this.apiClient});

  final ApiClient apiClient;

  Future<List<ProductModel>?> getProducts() async {
    try {
      final response = await apiClient.get(NSConstants.endPointProducts);
      final data = response.data as List<dynamic>?;
      return data
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>?> getIdProductFavorites(String? userId) async {
    String url =
        '${NSConstants.endPointUsers}?uuid=eq.$userId&select=favorites';
    try {
      final response = await apiClient.get(url);
      final data = response.data as List<dynamic>;
      if (data.isEmpty) {
        throw Exception('User not found');
      } else {
        return (data[0]['favorites'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> updateFavoriteProduct(
      String userId, List<String> products) async {
    try {
      final url = '${NSConstants.endPointUsers}?uuid=eq.$userId';
      apiClient.patch(url, data: {'favorites': products});
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductModel>?> fetchProductByName(String name) async {
    try {
      final url = '${NSConstants.endPointProducts}?name=ilike.*$name*';
      final response = await apiClient.get(url);
      final data = response.data as List<dynamic>;
      return data
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
