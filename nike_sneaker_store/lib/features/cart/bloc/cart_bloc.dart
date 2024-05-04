// ignore_for_file: avoid_function_literals_in_foreach_calls, cascade_invocations

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/cart/bloc/cart_event.dart';
import 'package:nike_sneaker_store/features/cart/bloc/cart_state.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/product_model.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';
import 'package:nike_sneaker_store/services/handle_error/error_extension.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this.productRepository, this.userRepository)
      : super(const CartState()) {
    on<CartStarted>(_onStarted);
    on<CartInsertPressed>(_onAddToCart);
    on<CartIncrementPressed>(_onPlusProduct);
    on<CartDecrementPressed>(_onLessProduct);
  }

  ProductRepository productRepository;
  UserRepository userRepository;

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(state.copyWith(viewStatus: CartViewStatus.loading));
    try {
      final myCarts =
          await productRepository.getIdProductCart(event.userId) ?? [];

      emit(state.copyWith(
        viewStatus: CartViewStatus.success,
        myCarts: myCarts,
      ));
    } catch (e) {
      String? message;

      e is DioException
          ? message = e.getFailure().message
          : message = e.toString();

      emit(state.copyWith(
        viewStatus: CartViewStatus.failure,
        message: message,
      ));
    }
  }

  Future<void> _onAddToCart(
      CartInsertPressed event, Emitter<CartState> emit) async {
    emit(state.copyWith(cartInsertStatus: CartQuantityStatus.insertLoading));
    try {
      final isValid = state.myCarts.any((e) => e.uuid == event.product.uuid);
      if (isValid) {
        List<ProductModel> products = [...state.myCarts];
        products.forEach((element) {
          if (element.uuid == event.product.uuid) {
            element.quantity = (element.quantity ?? 0) + 1;
          }
        });
        await userRepository.updateInformationUser(
          UserModel(uuid: event.userId, myCarts: products),
        );
        emit(
          state.copyWith(
            myCarts: products,
            cartInsertStatus: CartQuantityStatus.insertSuccess,
            message: AppLocalizations.of(event.context).productAddSuccess,
          ),
        );
      } else {
        List<ProductModel> products = [
          ...state.myCarts,
          event.product.copyWith(quantity: 1)
        ];
        await userRepository.updateInformationUser(
          UserModel(uuid: event.userId, myCarts: products),
        );
        emit(
          state.copyWith(
            myCarts: products,
            cartInsertStatus: CartQuantityStatus.insertSuccess,
            message: AppLocalizations.of(event.context).productAddSuccess,
          ),
        );
      }
    } catch (e) {
      String? message;

      e is DioException
          ? message = e.getFailure().message
          : message = e.toString();

      emit(state.copyWith(
        cartInsertStatus: CartQuantityStatus.insertFailure,
        message: message,
      ));
    }
  }

  Future<void> _onPlusProduct(
      CartIncrementPressed event, Emitter<CartState> emit) async {
    emit(state.copyWith(
      cartInsertStatus: CartQuantityStatus.incrementLoading,
    ));
    try {
      final products = state.myCarts.map((element) {
        if (element.uuid == event.productId) {
          element = element.copyWith(
            quantity: (element.quantity ?? 0) + 1,
          );
        }
        return element;
      }).toList();
      emit(state.copyWith(
        cartInsertStatus: CartQuantityStatus.incrementSuccess,
        myCarts: products,
      ));
      userRepository.updateInformationUser(
        UserModel(uuid: event.userId, myCarts: products),
      );
    } catch (e) {
      String? message;

      e is DioException
          ? message = e.getFailure().message
          : message = e.toString();
      emit(state.copyWith(
        cartInsertStatus: CartQuantityStatus.incrementFailure,
        message: message,
      ));
    }
  }

  Future<void> _onLessProduct(
      CartDecrementPressed event, Emitter<CartState> emit) async {
    emit(state.copyWith(
      cartInsertStatus: CartQuantityStatus.decrementLoading,
    ));
    try {
      List<ProductModel> products = state.myCarts.map((e) {
        if (e.uuid == event.productId) {
          e = e.copyWith(
            quantity: (e.quantity ?? 0) - 1,
          );
          if (e.quantity == 0) {
            emit(state.copyWith(
              cartInsertStatus: CartQuantityStatus.decrementFailure,
            ));
          }
        }
        return e;
      }).toList();
      products = products.where((e) => (e.quantity ?? 0) > 0).toList();
      emit(state.copyWith(
        cartInsertStatus: CartQuantityStatus.decrementSuccess,
        myCarts: products,
      ));
      userRepository.updateInformationUser(
        UserModel(uuid: event.userId, myCarts: products),
      );
    } catch (e) {
      String? message;

      e is DioException
          ? message = e.getFailure().message
          : message = e.toString();

      emit(state.copyWith(
        cartInsertStatus: CartQuantityStatus.decrementFailure,
        message: message,
      ));
    }
  }
}
