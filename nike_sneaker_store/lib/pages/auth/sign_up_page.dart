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
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  void isShowLoading() {
    setState(() => isLoading = true);
  }

  void isHideLoading() {
    setState(() => isLoading = false);
  }

  Future<void> onRegister() async {
    if (formKey.currentState != null && !formKey.currentState!.validate()) return;
    isShowLoading();
    await Future.delayed(const Duration(seconds: 2));
    bool checkUser = accounts.any((e) => emailController.text == e.email);
    if (checkUser) {
      isHideLoading();
      NSSnackBar.snackbarError(
        context,
        title: AppLocalizations.of(context).emailAlreadyExists,
      );
    } else {
      UserModel user = UserModel(
        uuid: Maths.randomUUid(length: 6),
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      accounts.add(user);
      isHideLoading();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(
              top: MediaQuery.paddingOf(context).top + 23,
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
              const SizedBox(height: 54),
              TitleLabel(text: AppLocalizations.of(context).yourName),
              NSTextFormField.text(
                controller: nameController,
                hintText: AppLocalizations.of(context).hintTextDefault,
                validator: (value) =>
                    Validator.validatorRequired(context, value),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              TitleLabel(text: AppLocalizations.of(context).emailAddress),
              NSTextFormField.text(
                controller: emailController,
                hintText: AppLocalizations.of(context).hintTextEmail,
                validator: (value) => Validator.validatorEmail(context, value),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              TitleLabel(text: AppLocalizations.of(context).password),
              NSTextFormField.password(
                controller: passwordController,
                hintText: AppLocalizations.of(context).hintTextPassword,
                validator: (value) =>
                    Validator.validatorPassword(context, value),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              TitleLabel(text: AppLocalizations.of(context).confirmPassword),
              NSTextFormField.password(
                controller: confirmController,
                hintText: AppLocalizations.of(context).hintTextPassword,
                validator: (value) => Validator.validatorConfirmPassword(
                  context,
                  value,
                  passwordController.text,
                ),
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) => onRegister(),
              ),
              const SizedBox(height: 30),
              NSElevatedButton.text(
                onPressed: onRegister,
                text: AppLocalizations.of(context).signUp,
                isDisable: isLoading,
              ),
              const SizedBox(height: 50),
              PromptText(
                text: AppLocalizations.of(context).alreadyAccount,
                title: AppLocalizations.of(context).signIn,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
