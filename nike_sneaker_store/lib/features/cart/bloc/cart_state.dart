import 'package:equatable/equatable.dart';
import 'package:nike_sneaker_store/models/product_model.dart';

enum CartViewStatus { initial, loading, success, failure }

extension ExCartViewStatus on CartViewStatus {
  bool get isInitial => this == CartViewStatus.initial;
  bool get isLoading => this == CartViewStatus.loading;
  bool get isSuccess => this == CartViewStatus.success;
  bool get isFailure => this == CartViewStatus.failure;
}

enum CartQuantityStatus {
  initial,
  insertLoading,
  insertSuccess,
  insertFailure,
  incrementLoading,
  incrementSuccess,
  incrementFailure,
  decrementLoading,
  decrementSuccess,
  decrementFailure,
}

class CartState extends Equatable {
  const CartState({
    this.viewStatus = CartViewStatus.initial,
    this.myCarts = const [],
    this.message = '',
    this.cartInsertStatus = CartQuantityStatus.initial,
  });

  final CartViewStatus viewStatus;
  final List<ProductModel> myCarts;
  final CartQuantityStatus cartInsertStatus;
  final String message;

  CartState copyWith({
    CartViewStatus? viewStatus,
    List<ProductModel>? myCarts,
    String? message,
    CartQuantityStatus? cartInsertStatus,
  }) {
    return CartState(
      viewStatus: viewStatus ?? this.viewStatus,
      myCarts: myCarts ?? this.myCarts,
      message: message ?? this.message,
      cartInsertStatus: cartInsertStatus ?? this.cartInsertStatus,
    );
  }

  @override
  List<Object?> get props => [
        viewStatus,
        myCarts,
        message,
        cartInsertStatus,
      ];
}
