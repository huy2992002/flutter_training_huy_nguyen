// ignore_for_file: avoid_function_literals_in_foreach_calls, cascade_invocations

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_event.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_state.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';
import 'package:nike_sneaker_store/utils/enum.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this.productRepository,
    this.authRepository,
    this.userRepository,
  ) : super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeLoadMore>(_onLoadItem);
    on<HomeCategoryPressed>(_onChangedCategory);
    on<HomeFavoritePressed>(_onFavoriteProduct);
  }

  final ProductRepository productRepository;
  final AuthRepository authRepository;
  final UserRepository userRepository;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(state.copyWith(homeStatus: HomeViewStatus.loading));
    List<ProductModel> products = [];
    try {
      final productFavorites =
          await productRepository.getIdProductFavorites(event.userId) ?? [];
      products = await productRepository.getProducts() ?? [];
      final user = await authRepository.getUser(userId: event.userId);
      products.forEach((element) {
        if (productFavorites.any((e) => e == element.uuid)) {
          element.isFavorite = true;
        }
      });
      emit(state.copyWith(
        products: products,
        productDisplays: products,
        user: user,
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

  Future<void> _onLoadItem(HomeLoadMore event, Emitter<HomeState> emit) async {
    if (state.loadStatus == HomeLoadMoreStatus.loadCompeted) return;

    emit(state.copyWith(loadStatus: HomeLoadMoreStatus.loading));
    List<ProductModel> products = [];
    try {
      int oldItem = state.products.length;
      int item = state.maxItem + 2;

      products = await productRepository.getProducts(maxLength: item) ?? [];
      emit(state.copyWith(
        products: products,
        maxItem: item,
        loadStatus: HomeLoadMoreStatus.loadSuccess,
      ));
      _onChangedCategory(
        HomeCategoryPressed(
            index: state.categoryIndex, type: event.types[state.categoryIndex]),
        emit,
      );

      if (products.length == oldItem || products.length > 20) {
        emit(state.copyWith(loadStatus: HomeLoadMoreStatus.loadCompeted));
      }
    } catch (e) {
      String? message;

      e is DioException ? message = e.message : message = e.toString();

      emit(state.copyWith(
        loadStatus: HomeLoadMoreStatus.loadFailure,
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

      userRepository.updateInformationUser(UserModel(
        uuid: event.userId,
        favorites: productFavorites,
      ));
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
