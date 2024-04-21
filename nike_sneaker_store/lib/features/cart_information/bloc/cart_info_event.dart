import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class CartInfoEvent extends Equatable {}

class CartInfoStarted extends CartInfoEvent {
  CartInfoStarted(
    this.context, {
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  final BuildContext context;
  final String email;
  final String phoneNumber;
  final String address;

  @override
  List<Object?> get props => [email, phoneNumber, address];
}

class CartInfoCheckoutPressed extends CartInfoEvent {
  @override
  List<Object?> get props => [];
}

class CartInfoEmailChanged extends CartInfoEvent {
  CartInfoEmailChanged(this.context, {required this.email});

  final String email;
  final BuildContext context;

  @override
  List<Object?> get props => [email, context];
}

class CartInfoAddressChanged extends CartInfoEvent {
  CartInfoAddressChanged(this.context, {required this.address});

  final String address;
  final BuildContext context;

  @override
  List<Object?> get props => [address, context];
}

class CartInfoPhoneChanged extends CartInfoEvent {
  CartInfoPhoneChanged(this.context, {required this.phoneNumber});

  final String phoneNumber;
  final BuildContext context;

  @override
  List<Object?> get props => [phoneNumber, context];
}
