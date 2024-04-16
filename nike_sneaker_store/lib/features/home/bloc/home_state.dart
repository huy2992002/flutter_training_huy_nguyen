import 'package:equatable/equatable.dart';
import 'package:nike_sneaker_store/models/product_model.dart';

enum HomeViewStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.products = const [],
    this.productDisplays = const [],
    this.categoryIndex = 0,
    this.homeStatus = HomeViewStatus.initial,
    this.errorMessage = '',
  });

  final List<ProductModel> products;
  final List<ProductModel> productDisplays;
  final int categoryIndex;
  final HomeViewStatus homeStatus;
  final String errorMessage;

  HomeState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? productDisplays,
    int? categoryIndex,
    HomeViewStatus? homeStatus,
    String? errorMessage,
  }) {
    return HomeState(
      products: products ?? this.products,
      productDisplays: productDisplays ?? this.productDisplays,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      homeStatus: homeStatus ?? this.homeStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        products,
        productDisplays,
        productDisplays.hashCode,
        categoryIndex,
        homeStatus,
        errorMessage,
      ];
}
