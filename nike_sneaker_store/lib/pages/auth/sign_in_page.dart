import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_auth.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_label.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_under.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
          top: MediaQuery.paddingOf(context).top + 80,
        ),
        children: [
          TitleAuth(
            title: AppLocalizations.of(context).helloAgain,
            subTitle: AppLocalizations.of(context).fillYourDetails,
          ),
          const SizedBox(height: 54),
          TitleLabel(text: AppLocalizations.of(context).emailAddress),
          const NSTextFormField.text(hintText: 'xyz@gmail.com'),
          const SizedBox(height: 30),
          TitleLabel(text: AppLocalizations.of(context).password),
          const NSTextFormField.password(hintText: '••••••••'),
          const SizedBox(height: 12),
          Text(
            AppLocalizations.of(context).recoveryPassword,
            style: NSStyle.h12Normal,
            textAlign: TextAlign.right,
          ),
          const SizedBox(height: 24),
          NSElevatedButton.text(
            onPressed: () {},
            text: AppLocalizations.of(context).signIn,
          ),
          const SizedBox(height: 200),
          TitleUnder(
            text: AppLocalizations.of(context).newUser,
            title: AppLocalizations.of(context).createAccount,
          ),
        ],
      ),
    );
  }
}
