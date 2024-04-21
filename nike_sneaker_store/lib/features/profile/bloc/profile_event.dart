import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ProfileEvent extends Equatable {}

class ProfileStarted extends ProfileEvent {
  ProfileStarted(
    this.context, {
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.avatar,
  });

  final BuildContext context;
  final String name;
  final String address;
  final String phoneNumber;
  final String avatar;

  @override
  List<Object?> get props => [name, address, phoneNumber, avatar];
}

class ProfileNameChanged extends ProfileEvent {
  ProfileNameChanged(this.context, {required this.name});

  final String name;
  final BuildContext context;

  @override
  List<Object?> get props => [name, context];
}

class ProfileAddressChanged extends ProfileEvent {
  ProfileAddressChanged(this.context, {required this.address});

  final String address;
  final BuildContext context;

  @override
  List<Object?> get props => [address, context];
}

class ProfilePhoneChanged extends ProfileEvent {
  ProfilePhoneChanged(this.context, {required this.phoneNumber});

  final String phoneNumber;
  final BuildContext context;

  @override
  List<Object?> get props => [phoneNumber, context];
}

class ProfileSavePressed extends ProfileEvent {
  ProfileSavePressed({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}

class ProfileAvatarChanged extends ProfileEvent {
  ProfileAvatarChanged({required this.context});

  final BuildContext context;

  @override
  List<Object?> get props => [context];
}
