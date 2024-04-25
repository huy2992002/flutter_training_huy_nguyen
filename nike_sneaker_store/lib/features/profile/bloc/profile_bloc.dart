import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_event.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_state.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
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
    on<ProfileAvatarChanged>(_onAvatarChanged);
  }

  final UserRepository userRepository;

  Future<void> _onStarted(
    ProfileStarted event,
    Emitter<ProfileState> emit,
  ) async {
    String? name = event.name;
    String? address = event.address;
    String? phoneNumber = event.phoneNumber;
    String? avatar = event.avatar;

    UserModel? user = UserModel(
      name: name,
      address: address,
      phone: phoneNumber,
    );

    emit(state.copyWith(
      name: name,
      address: address,
      phoneNumber: phoneNumber,
      avatar: avatar,
      user: user,
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
      file: state.fileImage,
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
      file: state.fileImage,
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
      file: state.fileImage,
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
    emit(state.copyWith(buttonStatus: ProfileSaveStatus.loading));
    try {
      String? avatar = await userRepository.uploadAvatar(state.fileImage);
      await userRepository.updateInformationUser(
        UserModel(
          uuid: event.userId,
          name: state.name,
          address: state.address,
          phone: state.phoneNumber,
          avatar: avatar,
        ),
      );
      emit(state.copyWith(
        user: UserModel(
          name: state.name,
          address: state.address,
          phone: state.phoneNumber,
          avatar: avatar,
        ),
        canAction: false,
        buttonStatus: ProfileSaveStatus.success,
      ));
    } catch (e) {
      String? message;

      e is DioException ? message = e.message : message = e.toString();

      emit(state.copyWith(
        buttonStatus: ProfileSaveStatus.failure,
        message: message,
      ));
    }
  }

  Future<void> _onAvatarChanged(
    ProfileAvatarChanged event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(avatarStatus: ProfileChangeProfileStatus.avatarLoading),
    );
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      File fileImage = File(result.files.single.path!);
      bool canAction = isValid(
        event.context,
        name: state.name,
        address: state.address,
        phoneNumber: state.phoneNumber,
        file: fileImage,
        user: state.user,
      );
      emit(
        state.copyWith(
          fileImage: fileImage,
          canAction: canAction,
          avatarStatus: ProfileChangeProfileStatus.avatarSuccess,
        ),
      );
    } else {
      emit(
        state.copyWith(
          avatarStatus: ProfileChangeProfileStatus.avatarFailure,
          message: AppLocalizations.of(event.context).selectImageSuccess,
        ),
      );
    }
  }
}

bool isValid(
  BuildContext context, {
  required String name,
  required String address,
  required String phoneNumber,
  File? file,
  UserModel? user,
}) {
  return Validator.validatorRequired(context, name) == null &&
      Validator.validatorRequired(context, address) == null &&
      Validator.validatorPhoneNumber(context, phoneNumber) == null &&
      (name != user?.name ||
          address != user?.address ||
          phoneNumber != user?.phone ||
          file != null);
}
