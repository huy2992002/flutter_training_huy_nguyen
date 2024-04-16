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
    try {
      if (event.searchText.isEmpty) {
        emit(state.copyWith(searchProducts: []));
      } else {
        final products =
            await productRepository.fetchProductByName(event.searchText);

        emit(state.copyWith(searchProducts: products));
      }
    } catch (e) {}
  }
}
