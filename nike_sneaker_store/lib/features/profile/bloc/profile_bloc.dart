import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_event.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_state.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';
import 'package:nike_sneaker_store/utils/validator.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.userRepository) : super(const ProfileState()) {
    on<ProfileStarted>(_onStarted);
    on<ProfileNameChanged>(_onNameChanged);
    on<ProfileAddressChanged>(_onAddressChanged);
    on<ProfilePhoneChanged>(_onPhoneChanged);
    on<ProfileSavePressed>(_onSaveInformation);
  }

  final UserRepository userRepository;

  Future<void> _onStarted(
    ProfileStarted event,
    Emitter<ProfileState> emit,
  ) async {
    String name = event.name;
    String address = event.address;
    String phoneNumber = event.phoneNumber;
    UserModel user = UserModel(
      name: name,
      address: address,
      phone: phoneNumber,
    );

    bool canAction = isValid(
      event.context,
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      user: user,
    );

    emit(state.copyWith(
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      user: user,
      canAction: canAction,
    ));
  }

  Future<void> _onNameChanged(
    ProfileNameChanged event,
    Emitter<ProfileState> emit,
  ) async {
    bool canAction = isValid(
      event.context,
      name: event.name,
      address: state.address,
      phoneNumber: state.phoneNumber,
      user: state.user,
    );

    emit(state.copyWith(
      name: event.name,
      canAction: canAction,
    ));
  }

  Future<void> _onAddressChanged(
    ProfileAddressChanged event,
    Emitter<ProfileState> emit,
  ) async {
    bool canAction = isValid(
      event.context,
      name: state.name,
      address: event.address,
      phoneNumber: state.phoneNumber,
      user: state.user,
    );

    emit(state.copyWith(
      address: event.address,
      canAction: canAction,
    ));
  }

  Future<void> _onPhoneChanged(
    ProfilePhoneChanged event,
    Emitter<ProfileState> emit,
  ) async {
    bool canAction = isValid(
      event.context,
      name: state.name,
      address: state.address,
      phoneNumber: event.phoneNumber,
      user: state.user,
    );

    emit(state.copyWith(
      phoneNumber: event.phoneNumber,
      canAction: canAction,
    ));
  }

  Future<void> _onSaveInformation(
    ProfileSavePressed event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileSaveStatus.loading));
    try {
      await userRepository.updateInformationUser(
        UserModel(
          uuid: event.userId,
          name: state.name,
          address: state.address,
          phone: state.phoneNumber,
        ),
      );
      emit(state.copyWith(
        user: UserModel(
          name: state.name,
          address: state.address,
          phone: state.phoneNumber,
        ),
        canAction: false,
        status: ProfileSaveStatus.success,
      ));
    } catch (e) {
      String? message;

      e is DioException ? message = e.message : message = e.toString();

      emit(state.copyWith(
        status: ProfileSaveStatus.failure,
        message: message,
      ));
    }
  }
}

bool isValid(
  BuildContext context, {
  required String name,
  required String address,
  required String phoneNumber,
  UserModel? user,
}) {
  return Validator.validatorRequired(context, name) == null &&
      Validator.validatorRequired(context, address) == null &&
      Validator.validatorPhoneNumber(context, phoneNumber) == null &&
      (name != user?.name ||
          address != user?.address ||
          phoneNumber != user?.phone);
}
