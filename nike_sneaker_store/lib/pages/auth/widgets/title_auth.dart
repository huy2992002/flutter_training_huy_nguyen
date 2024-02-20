import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/resources/ns_color.dart';
import 'package:nike_sneaker_store/resources/ns_style.dart';

class TitleAuth extends StatelessWidget {
  const TitleAuth({
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context).helloAgain,
            style: NSStyle.h32Bold,
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context).fillYourDetails,
            style: NSStyle.h16Medium.copyWith(
              color: NSColor.neutral,
            ),
          ),
        ],
      ),
    );
  }
}
