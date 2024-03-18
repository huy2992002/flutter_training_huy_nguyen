import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/button/ns_text_button.dart';
import 'package:nike_sneaker_store/components/snackbar/ns_snackbar.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';

class ProfilePage extends StatefulWidget {
  /// Screen profile page
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  /// The [TextEditingController] of [TextFormField] name
  TextEditingController _nameController = TextEditingController();

  /// The [TextEditingController] of [TextFormField] location
  TextEditingController _locationController = TextEditingController();

  /// The [TextEditingController] of [TextFormField] phone
  TextEditingController _phoneController = TextEditingController();

  /// File get & display file image avatar
  ///
  /// if [file] is null will display default avatar
  File? file;

  UserModel? userLogin;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() {
    userLogin = SharedPrefs.userLogin;
    _nameController.text = userLogin?.name ?? '';
    _locationController.text = userLogin?.address ?? '';
    _phoneController.text = userLogin?.phone ?? '';
    setState(() {});
  }

  bool canSave() {
    bool isNotEmpty = _nameController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty;

    bool hasChanged = _nameController.text != userLogin?.name ||
        _locationController.text != userLogin?.address ||
        _phoneController.text != userLogin?.phone;

    return isNotEmpty && hasChanged;
  }

  /// The Function use [FilePicker] get image from device and display by field [file]
  Future<void> changedAvatar() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path!);
      setState(() {});

      NSSnackBar.snackbarSuccess(
        context,
        title: AppLocalizations.of(context).avatarChangedSuccess,
      );
    } else {
      NSSnackBar.snackbarError(
        context,
        title: AppLocalizations.of(context).explore,
      );
    }
  }

  Future<void> saveUser() async {
    if (!canSave()) return;
    userLogin?.name = _nameController.text;
    userLogin?.address = _locationController.text;
    userLogin?.phone = _phoneController.text;
    SharedPrefs.userLogin = userLogin;
    NSSnackBar.snackbarSuccess(
      context,
      title: AppLocalizations.of(context).informationChangedSuccess,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: NSAppBar(
          title: AppLocalizations.of(context).profile,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                    child: CircleAvatar(
                  radius: 48,
                  backgroundImage: file == null
                      ? AssetImage(Assets.images.imgAvatar.path)
                      : Image.file(file!).image,
                )),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    userLogin?.name ?? '',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: NsTextButton(
                    onPressed: changedAvatar,
                    text: AppLocalizations.of(context).changeProfilePicture,
                    textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                const SizedBox(height: 43),
                Text(
                  AppLocalizations.of(context).yourName,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 17),
                NSTextFormField.text(
                  controller: _nameController,
                  hintText: AppLocalizations.of(context).yourName,
                  onChanged: (_) {
                    canSave();
                    setState(() {});
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 34),
                Text(
                  AppLocalizations.of(context).location,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 17),
                NSTextFormField.text(
                  controller: _locationController,
                  hintText: AppLocalizations.of(context).location,
                  onChanged: (_) {
                    canSave();
                    setState(() {});
                  },
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 34),
                Text(
                  AppLocalizations.of(context).mobileNumber,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 17),
                NSTextFormField.text(
                  controller: _phoneController,
                  hintText: AppLocalizations.of(context).mobileNumber,
                  onChanged: (_) {
                    canSave();
                    setState(() {});
                  },
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => saveUser(),
                ),
                const SizedBox(height: 55),
                NSElevatedButton.text(
                  onPressed: saveUser,
                  text: AppLocalizations.of(context).saveNow,
                  backgroundColor: canSave()
                      ? Theme.of(context).colorScheme.primary
                      : NSColor.neutral.withOpacity(0.3),
                  textColor: canSave()
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
