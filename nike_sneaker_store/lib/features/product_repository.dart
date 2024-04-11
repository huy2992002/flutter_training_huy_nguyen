import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';

class ProductRepository {
  ProductRepository({required this.apiClient});

  final ApiClient apiClient;

  Future<List<ProductModel>?> getProducts() async {
    try {
      final response = await apiClient.get(NSConstants.endPointProducts);
      final data = response.data as List<dynamic>;
      return data
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
