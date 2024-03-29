import 'package:dart_practice/ex13_product_management_app/models/product_model.dart';

class BaseModel {
  BaseModel({
    required this.products,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  List<ProductModel> products;

  Map<String, dynamic> toJson() {
    return {
      'products': products,
    };
  }
}
