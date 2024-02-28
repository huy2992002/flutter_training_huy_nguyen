import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/splash/splash_page.dart';
import 'package:nike_sneaker_store/providers/app_provider.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';
import 'package:nike_sneaker_store/themes/ns_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.initialization();

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
      title: 'Nike Sneaker Store',
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Provider.of<AppProvider>(context).locale,
      theme: Provider.of<AppProvider>(context).themeData,
      darkTheme: NSTheme.darkTheme,
      home: const SplashPage(),
    );
  }
}
