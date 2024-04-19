import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:nike_sneaker_store/models/user_model.dart';

enum ProfileSaveStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  const ProfileState({
    this.user,
    this.name = '',
    this.address = '',
    this.phoneNumber = '',
    this.fileImage,
    this.status = ProfileSaveStatus.initial,
    this.canAction = false,
    this.message = '',
  });

  final UserModel? user;
  final String name;
  final String address;
  final String phoneNumber;
  final File? fileImage;
  final ProfileSaveStatus status;
  final bool canAction;
  final String message;

  ProfileState copyWith({
    UserModel? user,
    String? name,
    String? address,
    String? phoneNumber,
    File? fileImage,
    ProfileSaveStatus? status,
    bool? canAction,
    String? message,
  }) {
    return ProfileState(
      user: user ?? this.user,
      name: name ?? this.name,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fileImage: fileImage ?? this.fileImage,
      status: status ?? this.status,
      canAction: canAction ?? this.canAction,
      message: this.message,
    );
  }

  @override
  List<Object?> get props =>
      [name, address, phoneNumber, fileImage, status, canAction, message];
}
