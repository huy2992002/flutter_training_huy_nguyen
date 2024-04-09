import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/button/ns_text_button.dart';
import 'package:nike_sneaker_store/components/snackbar/ns_snackbar.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/features/auth/auth_repository.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_event.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/bloc/sign_in_state.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/view/widgets/prompt_text.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/view/widgets/title_auth.dart';
import 'package:nike_sneaker_store/features/auth/sign_in/view/widgets/title_label.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/routes/ns_routes_const.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:nike_sneaker_store/utils/validator.dart';

class SignInPage extends StatelessWidget {
  /// Screen sign in page
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    /// The [TextEditingController] of [TextFormField] email
    TextEditingController _emailController = TextEditingController();

    /// The [TextEditingController] of [TextFormField] password
    TextEditingController _passwordController = TextEditingController();

    /// The global key check [Validator] in page
    final _formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => SignInBloc(context.read<AuthRepository>()),
      child: BlocConsumer<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInFailed) {
            NSSnackBar.snackbarError(context, title: state.message);
          }
          if (state is SignInSuccess) {
            context.push(NSRoutesConst.pathLayout);
          }
        },
        builder: (context, state) {
          bool isLoading = state is SignInLoading;
          return GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: SafeArea(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20).copyWith(
                      top: 80,
                      bottom: 20,
                    ),
                    children: [
                      TitleAuth(
                        title: AppLocalizations.of(context).helloAgain,
                        subTitle: AppLocalizations.of(context).fillYourDetails,
                      ),
                      const SizedBox(height: 54),
                      TitleLabel(
                          text: AppLocalizations.of(context).emailAddress),
                      NSTextFormField.text(
                        controller: _emailController,
                        hintText: AppLocalizations.of(context).hintTextEmail,
                        validator: (value) =>
                            Validator.validatorEmail(context, value),
                        textInputAction: TextInputAction.next,
                        readOnly: isLoading,
                      ),
                      const SizedBox(height: 30),
                      TitleLabel(text: AppLocalizations.of(context).password),
                      NSTextFormField.password(
                        controller: _passwordController,
                        hintText: AppLocalizations.of(context).hintTextPassword,
                        validator: (value) =>
                            Validator.validatorPassword(context, value),
                        textInputAction: TextInputAction.done,
                        readOnly: isLoading,
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: NsTextButton(
                          onPressed: () => context.push(
                            NSRoutesConst.pathForgotPass,
                          ),
                          text: AppLocalizations.of(context).recoveryPassword,
                        ),
                      ),
                      const SizedBox(height: 24),
                      NSElevatedButton.text(
                        onPressed: () async {
                          if (_formKey.currentState == null ||
                              !_formKey.currentState!.validate()) {
                            return;
                          }
                          context.read<SignInBloc>().add(
                                SubmitSignInPressed(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                          print(
                              'object2 ${await context.read<SharedPrefServices>().getAccessToken()}');
                        },
                        text: AppLocalizations.of(context).signIn,
                        isDisable: isLoading,
                      ),
                      const SizedBox(height: 70),
                      PromptText(
                        text: AppLocalizations.of(context).newUser,
                        title: AppLocalizations.of(context).createAccount,
                        onTap: isLoading
                            ? null
                            : () => context.push(NSRoutesConst.pathSignUp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
