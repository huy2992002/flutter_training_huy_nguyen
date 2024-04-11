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
  }

  final ProductRepository productRepository;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    List<ProductModel> products = [];
    try {
      products = await productRepository.getProducts() ?? [];
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
}
