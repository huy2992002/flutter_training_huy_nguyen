import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/snackbar/ns_snackbar.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/pages/auth/sign_in_page.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/prompt_text.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_auth.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_label.dart';
import 'package:nike_sneaker_store/utils/maths.dart';
import 'package:nike_sneaker_store/utils/validator.dart';

class SignUpPage extends StatefulWidget {
  /// Screen sign up page
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  /// The [TextEditingController] of [TextFormField] name
  TextEditingController _nameController = TextEditingController();

  /// The [TextEditingController] of [TextFormField] email
  TextEditingController _emailController = TextEditingController();

  /// The [TextEditingController] of [TextFormField] password
  TextEditingController _passwordController = TextEditingController();

  /// The [TextEditingController] of [TextFormField] confirm password
  TextEditingController _confirmController = TextEditingController();

  /// If [_isLoading] is true display loading button
  bool _isLoading = false;

  /// The global key check [Validator] in page
  final _formKey = GlobalKey<FormState>();

  /// Function change [_isLoading] with parameter [status] & resetState
  void _showHiddenLoading({required bool status}) {
    setState(() => _isLoading = status);
  }

  /// Function when action register.
  ///
  /// Check [Validator] success.
  /// Check if [_emailController] is in the [accounts].
  /// If it is already there, the [NSSnackBar] will be displayed.
  /// If it is not in the account, add the user to the account
  Future<void> onRegister() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate())
      return;
    _showHiddenLoading(status: true);
    await Future.delayed(const Duration(seconds: 2));
    bool checkUser = accounts.any((e) => _emailController.text == e.email);
    if (checkUser) {
      _showHiddenLoading(status: false);
      NSSnackBar.snackbarError(
        context,
        title: AppLocalizations.of(context).emailAlreadyExists,
      );
    } else {
      UserModel user = UserModel(
        uuid: Maths.randomUUid(length: 6),
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );
      accounts.add(user);
      _showHiddenLoading(status: false);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const SignInPage()),
        (route) => false,
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
            padding: EdgeInsets.only(
              left: 20,
              top: MediaQuery.paddingOf(context).top + 18,
              right: 20,
            ),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: NsIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(
                    Assets.icons.icArrow,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ),
              const SizedBox(height: 11),
              TitleAuth(
                title: AppLocalizations.of(context).registerAccount,
                subTitle: AppLocalizations.of(context).fillYourDetails,
              ),
              const SizedBox(height: 40),
              TitleLabel(text: AppLocalizations.of(context).yourName),
              NSTextFormField.text(
                controller: _nameController,
                hintText: AppLocalizations.of(context).hintTextDefault,
                validator: (value) =>
                    Validator.validatorRequired(context, value),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              TitleLabel(text: AppLocalizations.of(context).emailAddress),
              NSTextFormField.text(
                controller: _emailController,
                hintText: AppLocalizations.of(context).hintTextEmail,
                validator: (value) => Validator.validatorEmail(context, value),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              TitleLabel(text: AppLocalizations.of(context).password),
              NSTextFormField.password(
                controller: _passwordController,
                hintText: AppLocalizations.of(context).hintTextPassword,
                validator: (value) =>
                    Validator.validatorPassword(context, value),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              TitleLabel(text: AppLocalizations.of(context).confirmPassword),
              NSTextFormField.password(
                controller: _confirmController,
                hintText: AppLocalizations.of(context).hintTextPassword,
                validator: (value) => Validator.validatorConfirmPassword(
                  context,
                  value,
                  _passwordController.text,
                ),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) => onRegister(),
              ),
              const SizedBox(height: 30),
              NSElevatedButton.text(
                onPressed: onRegister,
                text: AppLocalizations.of(context).signUp,
                isDisable: _isLoading,
              ),
              const SizedBox(height: 50),
              PromptText(
                text: AppLocalizations.of(context).alreadyAccount,
                title: AppLocalizations.of(context).signIn,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignInPage()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
