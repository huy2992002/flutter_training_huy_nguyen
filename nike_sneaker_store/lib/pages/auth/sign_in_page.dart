import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/snackbar/ns_snackbar.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_auth.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_label.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_under.dart';
import 'package:nike_sneaker_store/pages/main_page.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';
import 'package:nike_sneaker_store/utils/validator.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    void onLogin() {
      if (!formKey.currentState!.validate()) return;
      bool checkUser = accounts.any((e) =>
          emailController.text == e.email &&
          passwordController.text == e.password);
      if (checkUser) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      } else {
        NSSnackBar.snackbarError(
          context,
          title: AppLocalizations.of(context).emailOrPasswordIncorrect,
        );
      }
    }

    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
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
            NSTextFormField.text(
              controller: emailController,
              hintText: 'xyz@gmail.com',
              validator: (value) => Validator.validatorEmail(context, value),
            ),
            const SizedBox(height: 30),
            TitleLabel(text: AppLocalizations.of(context).password),
            NSTextFormField.password(
              controller: passwordController,
              hintText: '••••••••',
              validator: (value) => Validator.validatorPassword(context, value),
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalizations.of(context).recoveryPassword,
              style: NSStyle.h12Normal,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 24),
            NSElevatedButton.text(
              onPressed: onLogin,
              text: AppLocalizations.of(context).signIn,
            ),
            const SizedBox(height: 200),
            TitleUnder(
              text: AppLocalizations.of(context).newUser,
              title: AppLocalizations.of(context).createAccount,
            ),
          ],
        ),
      ),
    );
  }
}
