import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/product_repository.dart';
import 'package:nike_sneaker_store/features/search/bloc/search_event.dart';
import 'package:nike_sneaker_store/features/search/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.productRepository}) : super(const SearchState()) {
    on<SearchTextChanged>(_onSearch);
  }

  ProductRepository productRepository;

  Future<void> _onSearch(
      SearchTextChanged event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchViewStatus.loading));
    print('object ${state.status}');
    try {
      if (event.searchText.isEmpty) {
        emit(state.copyWith(searchProducts: []));
      } else {
        final products =
            await productRepository.fetchProductByName(event.searchText);

        emit(
          state.copyWith(
            status: SearchViewStatus.success,
            searchProducts: products,
          ),
        );
      }
    } catch (e) {
      String? message;

      if (e is DioException) {
        message = e.message;
      } else {
        message = e.toString();
      }

      emit(state.copyWith(
        status: SearchViewStatus.failure,
        errorMessage: message,
      ));
    }
  }
}