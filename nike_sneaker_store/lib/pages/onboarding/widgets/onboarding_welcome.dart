import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class OnboardingWelcome extends StatelessWidget {
  const OnboardingWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).welcomeTo.toUpperCase(),
            style: NSStyle.h32Black.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Image.asset(Assets.images.imgPrOnboard1.path)
        ],
      ),
    );
  }
}
