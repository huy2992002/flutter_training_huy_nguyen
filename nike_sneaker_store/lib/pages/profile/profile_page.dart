import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/app_bar/ns_app_bar.dart';
import 'package:nike_sneaker_store/components/avatar/ns_avatar.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _nameController.text = userLogin?.name ?? '';
    _locationController.text = userLogin?.address ?? '';
    _phoneController.text = userLogin?.phone ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: NSAppBar(
          title: AppLocalizations.of(context).profile,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: NSAvatar(
                    imagePath:
                        userLogin?.avatar ?? Assets.images.imgAvatar.path,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    userLogin?.name ?? '',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Text(
                    AppLocalizations.of(context).changeProfilePicture,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
                const SizedBox(height: 43),
                Text(
                  AppLocalizations.of(context).yourName,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                const SizedBox(height: 17),
                NSTextFormField.text(
                  hintText: AppLocalizations.of(context).yourName,
                ),
                const SizedBox(height: 34),
                Text(
                  AppLocalizations.of(context).location,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                const SizedBox(height: 17),
                NSTextFormField.text(
                  hintText: AppLocalizations.of(context).location,
                ),
                const SizedBox(height: 34),
                Text(
                  AppLocalizations.of(context).mobileNumber,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                const SizedBox(height: 17),
                NSTextFormField.text(
                  hintText: AppLocalizations.of(context).mobileNumber,
                ),
                const SizedBox(height: 55),
                NSElevatedButton.text(
                  onPressed: () {},
                  text: AppLocalizations.of(context).saveNow,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
