import 'package:equatable/equatable.dart';
import 'package:nike_sneaker_store/models/product_model.dart';

class SearchState extends Equatable {
  const SearchState({this.searchProducts = const []});

  final List<ProductModel> searchProducts;

  SearchState copyWith({List<ProductModel>? searchProducts}) {
    return SearchState(searchProducts: searchProducts ?? this.searchProducts);
  }

  @override
  List<Object?> get props => [searchProducts, searchProducts.hashCode];
}
