import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class OnboardingStart extends StatelessWidget {
  const OnboardingStart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Column(
        children: [
          Image.asset(Assets.images.imgPrOnboardLetStart.path),
          const SizedBox(height: 50),
          Text(
            AppLocalizations.of(context).letStartJourney,
            style: NSStyle.h32Bold
                .copyWith(color: Theme.of(context).colorScheme.onSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            AppLocalizations.of(context).smartGorgeousFashionable,
            style: NSStyle.h16Normal.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
