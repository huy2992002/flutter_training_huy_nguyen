import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_auth.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_label.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_under.dart';
import 'package:nike_sneaker_store/utils/validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
          top: MediaQuery.paddingOf(context).top + 80,
        ),
        children: [
          TitleAuth(
            title: AppLocalizations.of(context).registerAccount,
            subTitle: AppLocalizations.of(context).fillYourDetails,
          ),
          const SizedBox(height: 54),
          TitleLabel(text: AppLocalizations.of(context).yourName),
          NSTextFormField.text(
            hintText: 'xxxxxxx',
            validator: (value) => Validator.validatorRequired(context, value),
          ),
          const SizedBox(height: 20),
          TitleLabel(text: AppLocalizations.of(context).emailAddress),
          NSTextFormField.text(
            hintText: 'xyz@gmail.com',
            validator: (value) => Validator.validatorEmail(context, value),
          ),
          const SizedBox(height: 20),
          TitleLabel(text: AppLocalizations.of(context).password),
          NSTextFormField.password(
            hintText: '••••••••',
            validator: (value) => Validator.validatorEmail(context, value),
          ),
          const SizedBox(height: 20),
          TitleLabel(text: AppLocalizations.of(context).confirmPassword),
          NSTextFormField.password(
            hintText: '••••••••',
            validator: (value) => Validator.validatorEmail(context, value),
          ),
          const SizedBox(height: 30),
          NSElevatedButton.text(
            onPressed: () {},
            text: AppLocalizations.of(context).signUp,
          ),
          const SizedBox(height: 50),
          TitleUnder(
            text: AppLocalizations.of(context).alreadyAccount,
            title: AppLocalizations.of(context).signIn,
          ),
        ],
      ),
    );
  }
}
