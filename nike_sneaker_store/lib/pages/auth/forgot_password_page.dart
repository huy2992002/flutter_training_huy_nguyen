import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/text_form_field/ns_text_form_field.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/auth/verification_page.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_auth.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_label.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: ListView(
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
              title: AppLocalizations.of(context).forgotPassword,
              subTitle: AppLocalizations.of(context).enterEmailResetPassword,
            ),
            const SizedBox(height: 40),
            TitleLabel(text: AppLocalizations.of(context).emailAddress),
            NSTextFormField.text(
              hintText: AppLocalizations.of(context).hintTextDefault,
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 40),
            NSElevatedButton.text(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VerificationPage(),
                ),
              ),
              text: AppLocalizations.of(context).resetPassword,
            ),
          ],
        ),
      ),
    );
  }
}
