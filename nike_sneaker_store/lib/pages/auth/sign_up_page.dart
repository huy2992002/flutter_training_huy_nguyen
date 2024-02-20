import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/snackbar/ns_snackbar.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/models/user_model.dart';
import 'package:nike_sneaker_store/pages/auth/sign_in_page.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  Future<void> onRegister() async {
    if (!formKey.currentState!.validate()) return;
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    bool checkUser = accounts.any((e) => emailController.text == e.email);
    if (checkUser) {
      setState(() => isLoading = false);
      NSSnackBar.snackbarError(
        context,
        title: 'email da ton tai',
      );
    } else {
      UserModel user = UserModel(
        id: '${int.parse(accounts.last.id) + 1}',
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      accounts.add(user);
      setState(() => isLoading = false);
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
                controller: nameController,
                hintText: 'xxxxxxx',
                validator: (value) =>
                    Validator.validatorRequired(context, value),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              TitleLabel(text: AppLocalizations.of(context).emailAddress),
              NSTextFormField.text(
                controller: emailController,
                hintText: 'xyz@gmail.com',
                validator: (value) => Validator.validatorEmail(context, value),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              TitleLabel(text: AppLocalizations.of(context).password),
              NSTextFormField.password(
                controller: passwordController,
                hintText: '••••••••',
                validator: (value) =>
                    Validator.validatorPassword(context, value),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 20),
              TitleLabel(text: AppLocalizations.of(context).confirmPassword),
              NSTextFormField.password(
                controller: confirmController,
                hintText: '••••••••',
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
              TitleUnder(
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
