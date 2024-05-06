import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:nike_sneaker_store/constants/ns_constants.dart';
import 'package:nike_sneaker_store/features/cart/bloc/cart_bloc.dart';
import 'package:nike_sneaker_store/features/cart/bloc/cart_event.dart';
import 'package:nike_sneaker_store/features/detail/bloc/detail_bloc.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_bloc.dart';
import 'package:nike_sneaker_store/features/home/bloc/home_event.dart';
import 'package:nike_sneaker_store/features/setting/bloc/setting_bloc.dart';
import 'package:nike_sneaker_store/features/setting/bloc/setting_state.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';
import 'package:nike_sneaker_store/routes/ns_routes_config.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';
import 'package:nike_sneaker_store/services/remote/supabase_services.dart';
import 'package:nike_sneaker_store/themes/ns_theme.dart';
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
    DevicePreview(
      builder: (context) => const MyApp(),
    ),
  );
}

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

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
          RepositoryProvider<ApiClient>(
            create: (context) => ApiClient(
              dio: Dio(),
              supabaseClient: Supabase.instance.client,
              prefs: context.read<SharedPrefServices>(),
            ),
          ),
          RepositoryProvider<AuthRepository>(
            create: (context) => AuthRepository(
              supabaseServices: context.read<SupabaseServices>(),
              sharedPrefServices: context.read<SharedPrefServices>(),
            ),
          ),
          RepositoryProvider<ProductRepository>(
            create: (context) => ProductRepository(
              supabaseServices: context.read<SupabaseServices>(),
            ),
          ),
          RepositoryProvider<UserRepository>(
            create: (context) => UserRepository(
              supabaseServices: context.read<SupabaseServices>(),
              apiClient: context.read<ApiClient>(),
            ),
          ),
          RepositoryProvider<ZoomDrawerController>(
            create: (context) => ZoomDrawerController(),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              context.read<ProductRepository>(),
              context.read<UserRepository>(),
            )..add(HomeStarted(
                userId: Supabase.instance.client.auth.currentUser?.id ?? '',
              )),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(
              context.read<ProductRepository>(),
              context.read<UserRepository>(),
            )..add(CartStarted(
                userId: Supabase.instance.client.auth.currentUser?.id ?? '',
              )),
          ),
          BlocProvider<SettingBloc>(create: (context) => SettingBloc()),
          BlocProvider<DetailBloc>(create: (context) => DetailBloc()),
        ],
        child: BlocBuilder<SettingBloc, SettingState>(
          builder: (context, state) {
            return MaterialApp.router(
              title: 'Nike Sneaker Store',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state.locale,
              themeMode: state.themeData == NSTheme.lightTheme
                  ? ThemeMode.light
                  : ThemeMode.dark,
              theme: NSTheme.lightTheme,
              darkTheme: NSTheme.darkTheme,
              routerConfig: NSRoutesConfig.goRoute,
              scaffoldMessengerKey: scaffoldMessengerKey,
            );
          },
        ));
  }
}
