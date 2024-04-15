import 'package:nike_sneaker_store/models/product_model.dart';

abstract class FavoriteEvent {}

class FavoriteStarted extends FavoriteEvent {
  FavoriteStarted({this.uuid});
  final String? uuid;
}

class FavoritePressed extends FavoriteEvent {
  FavoritePressed(this.userId, {required this.product});

  final String userId;
  final ProductModel product;
}

class FavoriteRemove extends FavoriteEvent {
  FavoriteRemove(this.userId, {required this.productID});

  final String userId;
  final String productID;
}
