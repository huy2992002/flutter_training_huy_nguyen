import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/search/bloc/search_bloc.dart';
import 'package:nike_sneaker_store/features/search/view/search_page.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';

class SearchProvider extends StatelessWidget {
  const SearchProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(
        productRepository: context.read<ProductRepository>(),
      ),
      child: const SearchPage(),
    );
  }
}
