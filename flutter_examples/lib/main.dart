import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_examples/l10n/app_localizations.dart';
import 'package:flutter_examples/main_page.dart';
import 'package:flutter_examples/theming/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => AppProvider(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Flutter Demo',
      theme: Provider.of<AppProvider>(context).themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Provider.of<AppProvider>(context).locale,
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      home: const MainPage(),
    );
  }
}
