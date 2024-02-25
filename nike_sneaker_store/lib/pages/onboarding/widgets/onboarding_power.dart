import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class OnboardingPower extends StatelessWidget {
  const OnboardingPower({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Column(
        children: [
          Image.asset(Assets.images.imgPrOnboardPower.path),
          const SizedBox(height: 50),
          Text(
            AppLocalizations.of(context).youHavePowerTo,
            style: NSStyle.h32Bold.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            AppLocalizations.of(context).thereAreManyBeautifulAttractive,
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
