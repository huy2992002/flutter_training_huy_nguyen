import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nike_sneaker_store/components/button/ns_elevated_button.dart';
import 'package:nike_sneaker_store/components/button/ns_icon_button.dart';
import 'package:nike_sneaker_store/components/otp/ns_otp_code.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_auth.dart';
import 'package:nike_sneaker_store/pages/auth/widgets/title_label.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            title: AppLocalizations.of(context).otpVerification,
            subTitle: AppLocalizations.of(context).pleaseCheckYourEmail,
          ),
          const SizedBox(height: 40),
          TitleLabel(text: AppLocalizations.of(context).otpCode),
          const NSOtpCode(),
          const SizedBox(height: 40),
          NSElevatedButton.text(
            onPressed: () {},
            text: AppLocalizations.of(context).verify,
          ),
        ],
      ),
    );
  }
}
