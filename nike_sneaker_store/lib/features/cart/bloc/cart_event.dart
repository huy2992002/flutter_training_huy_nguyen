import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/models/product_model.dart';

abstract class CartEvent extends Equatable {}

class CartStarted extends CartEvent {
  CartStarted({required this.userId});
  final String userId;

  @override
  List<Object?> get props => [userId];
}

class CartInsertPressed extends CartEvent {
  CartInsertPressed(
    this.context, {
    required this.userId,
    required this.product,
  });

  final BuildContext context;
  final String userId;
  final ProductModel product;

  @override
  List<Object?> get props => [userId, product, context];
}

class CartIncrementPressed extends CartEvent {
  CartIncrementPressed({
    required this.userId,
    required this.productId,
  });

  final String userId;
  final String productId;

  @override
  List<Object?> get props => [userId, productId];
}

class CartDecrementPressed extends CartEvent {
  CartDecrementPressed({
    required this.userId,
    required this.productId,
  });

  final String userId;
  final String productId;

  @override
  List<Object?> get props => [userId, productId];
}
