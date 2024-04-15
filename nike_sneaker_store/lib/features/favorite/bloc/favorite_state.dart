import 'package:equatable/equatable.dart';
import 'package:nike_sneaker_store/models/product_model.dart';

class FavoriteState extends Equatable {
  const FavoriteState({this.favoriteProducts = const []});
  final List<ProductModel> favoriteProducts;

  FavoriteState copyWith({List<ProductModel>? favoriteProducts}) {
    return FavoriteState(
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
    );
  }

  @override
  List<Object?> get props => [favoriteProducts, favoriteProducts.hashCode];
}
