import 'package:flutter/material.dart';
import 'package:flutter_examples/l10n/app_localizations.dart';
import 'package:flutter_examples/theming/app_provider.dart';
import 'package:provider/provider.dart';

class LocalizationPage extends StatefulWidget {
  const LocalizationPage({super.key});

  @override
  State<LocalizationPage> createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.helloWorld),
        ElevatedButton(
          onPressed: () {
            Provider.of<AppProvider>(context,listen: false).changeLocale();
          },
          child: const Text('Change'),
        ),
      ],
    );
  }
}
