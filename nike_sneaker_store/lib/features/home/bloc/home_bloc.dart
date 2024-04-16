// ignore_for_file: avoid_function_literals_in_foreach_calls, cascade_invocations

import 'package:dio/dio.dart';
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
  }

  final ProductRepository productRepository;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStatus: HomeViewStatus.loading));
    List<ProductModel> products = [];
    try {
      final productFavorites =
          await productRepository.getIdProductFavorites(event.userId) ?? [];
      products = await productRepository.getProducts() ?? [];
      products.forEach((element) {
        if (productFavorites.any((e) => e == element.uuid)) {
          element.isFavorite = true;
        }
      });
      emit(state.copyWith(
        products: products,
        productDisplays: products,
        categoryIndex: 0,
        homeStatus: HomeViewStatus.success,
      ));
    } catch (e) {
      String? message;

      if (e is DioException) {
        message = e.message;
      } else {
        message = e.toString();
      }

      emit(state.copyWith(
        categoryIndex: 0,
        homeStatus: HomeViewStatus.failure,
        errorMessage: message,
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
    List<ProductModel> products = [...state.products];
    List<String> productFavorites = [];
    try {
      products.forEach((e) {
        if (e.uuid == event.productId) {
          e.isFavorite = !e.isFavorite;
        }
        if (e.isFavorite == true && e.uuid != null) {
          productFavorites.add(e.uuid!);
        }
      });

      emit(state.copyWith(productDisplays: products));

      productRepository.updateFavoriteProduct(
        event.userId,
        productFavorites,
      );
    } catch (e) {
      String? message;

      if (e is DioException) {
        message = e.message;
      } else {
        message = e.toString();
      }

      emit(state.copyWith(
        homeStatus: HomeViewStatus.failure,
        errorMessage: message,
      ));
    }
  }
}
