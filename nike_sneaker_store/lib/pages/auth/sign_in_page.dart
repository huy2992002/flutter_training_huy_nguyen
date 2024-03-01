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
import 'package:nike_sneaker_store/services/local/shared_pref.dart';
import 'package:nike_sneaker_store/utils/validator.dart';

class SignInPage extends StatefulWidget {
  /// Screen sign in page
  const SignInPage({super.key, this.email});

  final String? email;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  /// The [TextEditingController] of [TextFormField] email
  TextEditingController _emailController = TextEditingController();

  /// The [TextEditingController] of [TextFormField] password
  TextEditingController _passwordController = TextEditingController();

  /// If [_isLoading] is true display loading button
  bool _isLoading = false;

  /// The global key check [Validator] in page
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.email ?? '';
    setState(() {});
  }

  /// Function when action login.
  ///
  /// Check [Validator] success.
  /// If the [_emailController] and [_passwordController] match the [accounts], go to the [MainPage] screen.
  /// If incorrect, show snackbar notification
  Future<void> _onLogin() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    List<UserModel> users = await SharedPrefs.getUsers() ?? accounts;
    try {
      UserModel user = users.singleWhere(
        (e) =>
            e.email == _emailController.text &&
            _passwordController.text == e.password,
      );
      setState(() => _isLoading = false);
      print('object user ${user.email}');
      await SharedPrefs.saveUserLogin(user);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const MainPage()),
        (route) => false,
      );
    } catch (e) {
      setState(() => _isLoading = false);
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
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
              top: MediaQuery.paddingOf(context).top + 80,
              bottom: 20,
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
                readOnly: _isLoading,
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
                readOnly: _isLoading,
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
              const SizedBox(height: 70),
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
