// ignore_for_file: cascade_invocations, avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/favorite/bloc/favorite_event.dart';
import 'package:nike_sneaker_store/features/favorite/bloc/favorite_state.dart';
import 'package:nike_sneaker_store/features/product_repository.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(this.productRepository) : super(const FavoriteState()) {
    on<FavoriteStarted>(_getProductFavorites);
    on<FavoritePressed>(_onFavorite);
    on<FavoriteRemove>(_removeFavorite);
  }

  final ProductRepository productRepository;

  Future<void> _getProductFavorites(
    FavoriteStarted event,
    Emitter<FavoriteState> emit,
  ) async {
    final results =
        await productRepository.getIdProductFavorites(event.uuid) ?? [];

    results.forEach((element) {
      element.isFavorite = true;
    });
    emit(state.copyWith(favoriteProducts: results));
  }

  Future<void> _onFavorite(
    FavoritePressed event,
    Emitter<FavoriteState> emit,
  ) async {
    final products = state.favoriteProducts;
    bool isValid = products.any((e) => e.uuid == event.product.uuid);
    if (isValid) {
      products.removeWhere((e) => e.uuid == event.product.uuid);
    } else {
      products.add(event.product);
    }
    products.forEach((element) {
      element.isFavorite = true;
    });
    emit(state.copyWith(favoriteProducts: [...products]));

    await productRepository.addFavoriteProduct(event.userId, products);
  }

  Future<void> _removeFavorite(
    FavoriteRemove event,
    Emitter<FavoriteState> emit,
  ) async {
    final products = state.favoriteProducts
      ..map((e) => e.isFavorite = true)
      ..removeWhere((e) => e.uuid == event.productID);

    emit(state.copyWith(favoriteProducts: [...products]));

    await productRepository.addFavoriteProduct(event.userId, products);
  }
}
