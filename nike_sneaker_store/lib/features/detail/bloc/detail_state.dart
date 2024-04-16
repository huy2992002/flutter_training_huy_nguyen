import 'package:equatable/equatable.dart';
import 'package:nike_sneaker_store/models/product_model.dart';

class DetailState extends Equatable {
  const DetailState({
    this.productDisplay,
    this.products = const [],
  });

  final ProductModel? productDisplay;
  final List<ProductModel> products;

  DetailState copyWith({
    ProductModel? productDisplay,
    List<ProductModel>? products,
  }) {
    return DetailState(
      productDisplay: productDisplay ?? this.productDisplay,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props =>
      [productDisplay, products, productDisplay.hashCode];
}
