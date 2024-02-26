import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/button/ns_text_button.dart';
import 'package:nike_sneaker_store/components/snackbar/ns_snackbar.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/pages/auth/forgot_password_page.dart';
import 'package:nike_sneaker_store/pages/auth/sign_up_page.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/prompt_text.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_auth.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_label.dart';
import 'package:nike_sneaker_store/pages/main/main_page.dart';
import 'package:nike_sneaker_store/utils/validator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  void _isShowLoading() {
    setState(() => _isLoading = true);
  }

  void _isHideLoading() {
    setState(() => _isLoading = false);
  }

  Future<void> _onLogin() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) return;
    _isShowLoading();
    await Future.delayed(const Duration(seconds: 2));
    bool checkUser = accounts.any((e) =>
        _emailController.text == e.email &&
        _passwordController.text == e.password);
    if (checkUser) {
      _isHideLoading();
      userLogin = accounts.singleWhere((e) => e.email == _emailController.text);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
        (route) => false,
      );
    } else {
      _isHideLoading();
      NSSnackBar.snackbarError(
        context,
        title: AppLocalizations.of(context).emailOrPasswordIncorrect,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Form(
          key: _formKey,
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
                controller: _emailController,
                hintText: AppLocalizations.of(context).hintTextEmail,
                validator: (value) => Validator.validatorEmail(context, value),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 30),
              TitleLabel(text: AppLocalizations.of(context).password),
              NSTextFormField.password(
                controller: _passwordController,
                hintText: AppLocalizations.of(context).hintTextPassword,
                validator: (value) =>
                    Validator.validatorPassword(context, value),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) => _onLogin(),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: NsTextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgotPasswordPage(),
                    ),
                  ),
                  text: AppLocalizations.of(context).recoveryPassword,
                ),
              ),
              const SizedBox(height: 24),
              NSElevatedButton.text(
                onPressed: _onLogin,
                text: AppLocalizations.of(context).signIn,
                isDisable: _isLoading,
              ),
              const SizedBox(height: 200),
              PromptText(
                text: AppLocalizations.of(context).newUser,
                title: AppLocalizations.of(context).createAccount,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpPage()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
