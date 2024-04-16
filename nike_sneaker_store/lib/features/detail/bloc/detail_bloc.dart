import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/detail/bloc/detail_event.dart';
import 'package:nike_sneaker_store/features/detail/bloc/detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(const DetailState()) {
    on<DetailSelectStarted>(_onSelectProduct);
  }

  Future<void> _onSelectProduct(
    DetailSelectStarted event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(
      productDisplay: event.product,
      products: event.products,
    ));
  }
}
