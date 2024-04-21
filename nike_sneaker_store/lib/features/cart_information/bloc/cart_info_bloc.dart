import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/cart_information/bloc/cart_info_event.dart';
import 'package:nike_sneaker_store/features/cart_information/bloc/cart_info_state.dart';
import 'package:nike_sneaker_store/utils/validator.dart';

class CartInfoBloc extends Bloc<CartInfoEvent, CartInfoState> {
  CartInfoBloc() : super(const CartInfoState()) {
    on<CartInfoStarted>(_onStarted);
    on<CartInfoEmailChanged>(_onEmailChanged);
    on<CartInfoPhoneChanged>(_onPhoneChanged);
    on<CartInfoAddressChanged>(_onAddressChanged);
    on<CartInfoCheckoutPressed>(_onCheckoutCart);
  }

  Future<void> _onStarted(
      CartInfoStarted event, Emitter<CartInfoState> emit) async {
    bool canAction = isValid(
      event.context,
      email: event.email,
      address: event.address,
      phoneNumber: event.phoneNumber,
    );
    emit(state.copyWith(
      email: event.email,
      phoneNumber: event.phoneNumber,
      address: event.address,
      canAction: canAction,
    ));
  }

  Future<void> _onEmailChanged(
      CartInfoEmailChanged event, Emitter<CartInfoState> emit) async {
    bool canAction = isValid(
      event.context,
      email: event.email,
      address: state.address,
      phoneNumber: state.phoneNumber,
    );
    emit(state.copyWith(
      email: event.email,
      canAction: canAction,
    ));
  }

  Future<void> _onPhoneChanged(
      CartInfoPhoneChanged event, Emitter<CartInfoState> emit) async {
    bool canAction = isValid(
      event.context,
      email: state.email,
      address: state.address,
      phoneNumber: event.phoneNumber,
    );
    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
      canAction: canAction,
    ));
  }

  Future<void> _onAddressChanged(
      CartInfoAddressChanged event, Emitter<CartInfoState> emit) async {
    bool canAction = isValid(
      event.context,
      email: state.email,
      address: event.address,
      phoneNumber: state.phoneNumber,
    );
    emit(state.copyWith(
      address: event.address,
      canAction: canAction,
    ));
  }

  Future<void> _onCheckoutCart(
      CartInfoCheckoutPressed event, Emitter<CartInfoState> emit) async {
    emit(state.copyWith(status: CartCheckOutStatus.checkoutLoading));
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      emit(state.copyWith(status: CartCheckOutStatus.checkoutSuccess));
    } catch (e) {
      emit(state.copyWith(
        status: CartCheckOutStatus.checkoutFailure,
        message: e.toString(),
      ));
    }
  }

  bool isValid(
    BuildContext context, {
    required String email,
    required String address,
    required String phoneNumber,
  }) {
    return Validator.validatorEmail(context, email) == null &&
        Validator.validatorRequired(context, address) == null &&
        Validator.validatorPhoneNumber(context, phoneNumber) == null;
  }
}
