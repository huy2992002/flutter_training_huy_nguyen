import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_bloc.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_event.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_state.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';

import '../../repository/mock_user_repository.dart';
import '../../utils/mock_file_picker.dart';

void main() {
  late UserRepository userRepository;
  late ProfileBloc profileBloc;
  late FilePicker filePicker;

  setUp(() {
    filePicker = MockFilePicker();
    userRepository = MockUserRepository();
    profileBloc = ProfileBloc(userRepository, filePicker);
  });

  group('Profile Bloc ', () {
    test('initial state is Profile State', () {
      expect(profileBloc.state, equals(const ProfileState()));
    });

    blocTest(
      'emits [avatarLoading, avatarSuccess] when file picking succeeds',
      build: () => profileBloc,
      act: (bloc) {
        bloc.add(ProfileAvatarChanged());
      },
      expect: () => [
        const ProfileState(
            avatarStatus: ProfileChangeProfileStatus.avatarLoading),
        ProfileState(
          fileImage: File('abc'),
          avatarStatus: ProfileChangeProfileStatus.avatarSuccess,
        ),
      ],
    );
  });
}
