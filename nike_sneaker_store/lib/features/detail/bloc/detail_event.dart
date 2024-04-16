import 'package:nike_sneaker_store/models/product_model.dart';

abstract class DetailEvent {}

class DetailSelectStarted extends DetailEvent {
  DetailSelectStarted({
    required this.product,
    required this.products,
  });

  final ProductModel product;
  final List<ProductModel> products;
}

class DetailChangeProductPressed extends DetailEvent {
  DetailChangeProductPressed({
    required this.product,
  });

  final ProductModel product;
}
