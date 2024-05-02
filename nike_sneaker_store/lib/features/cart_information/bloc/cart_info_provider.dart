import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/cart_information/bloc/cart_info_bloc.dart';
import 'package:nike_sneaker_store/features/cart_information/view/cart_information_page.dart';

class CartInfoProvider extends StatelessWidget {
  const CartInfoProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartInfoBloc>(
      create: (context) => CartInfoBloc(),
      child: const CartInformationPage(),
    );
  }
}
