import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/gen/assets.gen.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';

class OnboardingPower extends StatelessWidget {
  const OnboardingPower({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Column(
        children: [
          Image.asset(Assets.images.imgPrOnboardPower.path),
          const SizedBox(height: 30),
          Text(
            AppLocalizations.of(context).youHavePowerTo,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Text(
            AppLocalizations.of(context).thereAreManyBeautifulAttractive,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
