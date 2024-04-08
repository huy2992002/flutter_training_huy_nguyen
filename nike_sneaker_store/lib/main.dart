import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/pages/splash/splash_page.dart';
import 'package:nike_sneaker_store/providers/app_provider.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';
import 'package:nike_sneaker_store/services/remote/supabase_services.dart';
import 'package:nike_sneaker_store/themes/ns_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Supabase.initialize(
      url: NSConstants.urlSupabase, anonKey: NSConstants.apiKeySupabase);
  await SharedPrefs.initialization();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SupabaseServices>(
          create: (context) => SupabaseServices(
            supabaseClient: Supabase.instance.client,
          ),
        ),
        RepositoryProvider<SharedPrefServices>(
          create: (context) => SharedPrefServices(
            sharedPreferences: SharedPreferences.getInstance(),
          ),
        ),
        RepositoryProvider(
          create: (context) => ApiClient(
            dio: Dio(),
            supabaseClient: Supabase.instance.client,
            prefs: SharedPrefServices(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Nike Sneaker Store',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Provider.of<AppProvider>(context).locale,
        theme: Provider.of<AppProvider>(context).themeData,
        darkTheme: NSTheme.darkTheme,
        home: const SplashPage(),
      ),
    );
  }
}
