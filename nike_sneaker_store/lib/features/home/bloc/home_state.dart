import 'package:equatable/equatable.dart';
import 'package:nike_sneaker_store/models/product_model.dart';

class HomeState extends Equatable {
  const HomeState({
    this.products = const [],
    this.productDisplays = const [],
    this.categoryIndex = 0,
    this.isLoading = false,
  });

  final List<ProductModel> products;
  final List<ProductModel> productDisplays;
  final int categoryIndex;
  final bool isLoading;

  HomeState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? productDisplays,
    int? categoryIndex,
    bool? isLoading,
  }) {
    return HomeState(
      products: products ?? this.products,
      productDisplays: productDisplays ?? this.productDisplays,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        products,
        productDisplays,
        productDisplays.hashCode,
        categoryIndex,
        isLoading,
      ];
}
