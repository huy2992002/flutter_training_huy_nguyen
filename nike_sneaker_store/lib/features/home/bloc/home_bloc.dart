// ignore_for_file: avoid_function_literals_in_foreach_calls, cascade_invocations

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_event.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_state.dart';
import 'package:nike_sneaker_store/features/product_repository.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/utils/enum.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.productRepository) : super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeCategoryPressed>(_onChangedCategory);
    on<HomeFavoritePressed>(_onFavoriteProduct);
    on<HomeFavoriteRemove>(_removeFavoriteProduct);
  }

  final ProductRepository productRepository;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    List<ProductModel> products = [];
    try {
      final productFavorites =
          await productRepository.getIdProductFavorites(event.userId) ?? [];
      products = await productRepository.getProducts() ?? [];
      products.forEach((element) {
        if (productFavorites.any((e) => e.uuid == element.uuid)) {
          element.isFavorite = true;
        }
      });
      emit(state.copyWith(
        products: products,
        productDisplays: products,
        categoryIndex: 0,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        categoryIndex: 0,
        isLoading: false,
      ));
    }
  }

  Future<void> _onChangedCategory(
    HomeCategoryPressed event,
    Emitter<HomeState> emit,
  ) async {
    List<ProductModel> productDisplays = [];
    if (event.type == CategoryType.allShoes.name) {
      productDisplays = state.products;
    } else {
      productDisplays =
          state.products.where((e) => e.category == event.type).toList();
    }
    emit(state.copyWith(
      categoryIndex: event.index,
      productDisplays: productDisplays,
    ));
  }

  Future<void> _onFavoriteProduct(
    HomeFavoritePressed event,
    Emitter<HomeState> emit,
  ) async {
    final products = [...state.productDisplays];
    products[event.indexProduct].isFavorite =
        !products[event.indexProduct].isFavorite;

    emit(state.copyWith(productDisplays: products));
  }

  Future<void> _removeFavoriteProduct(
    HomeFavoriteRemove event,
    Emitter<HomeState> emit,
  ) async {
    final products = state.productDisplays;
    for (var element in products) {
      if (element.uuid == event.productId) {
        element.isFavorite = false;
      }
    }
    emit(state.copyWith(productDisplays: products));
  }
}
