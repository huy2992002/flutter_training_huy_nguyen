import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';

class NsPumpWidget extends StatelessWidget {
  const NsPumpWidget({
    required this.home,
    super.key,
  });
  final Widget home;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      home: home,
    );
  }
}
