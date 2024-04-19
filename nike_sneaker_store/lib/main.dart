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
import 'package:nike_sneaker_store/features/layout/bloc/layout_cubit.dart';
import 'package:nike_sneaker_store/features/notification/bloc/notification_bloc.dart';
import 'package:nike_sneaker_store/features/notification/bloc/notification_event.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_bloc.dart';
import 'package:nike_sneaker_store/features/profile/bloc/profile_event.dart';
import 'package:nike_sneaker_store/l10n/app_localizations.dart';
import 'package:nike_sneaker_store/providers/app_provider.dart';
import 'package:nike_sneaker_store/repository/auth_repository.dart';
import 'package:nike_sneaker_store/repository/product_repository.dart';
import 'package:nike_sneaker_store/repository/user_repository.dart';
import 'package:nike_sneaker_store/routes/ns_routes_config.dart';
import 'package:nike_sneaker_store/services/local/shared_pref.dart';
import 'package:nike_sneaker_store/services/local/shared_pref_services.dart';
import 'package:nike_sneaker_store/services/remote/api_client.dart';
import 'package:nike_sneaker_store/services/remote/supabase_services.dart';
import 'package:nike_sneaker_store/themes/ns_theme.dart';
import 'package:nike_sneaker_store/utils/debounce.dart';
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
        RepositoryProvider<ApiClient>(
          create: (context) => ApiClient(
            dio: Dio(),
            supabaseClient: Supabase.instance.client,
            prefs: SharedPrefServices(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(
            supabaseClient: Supabase.instance.client,
            sharedPrefServices: SharedPrefServices(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
            apiClient: ApiClient(
              dio: Dio(),
              supabaseClient: Supabase.instance.client,
              prefs: SharedPrefServices(
                sharedPreferences: SharedPreferences.getInstance(),
              ),
            ),
          ),
        ),
        RepositoryProvider<ProductRepository>(
          create: (context) => ProductRepository(
            apiClient: ApiClient(
              dio: Dio(),
              supabaseClient: Supabase.instance.client,
              prefs: context.read<SharedPrefServices>(),
            ),
          ),
        ),
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(
            apiClient: ApiClient(
              dio: Dio(),
              supabaseClient: Supabase.instance.client,
              prefs: context.read<SharedPrefServices>(),
            ),
          ),
        ),
        RepositoryProvider<ZoomDrawerController>(
          create: (context) => ZoomDrawerController(),
        ),
        RepositoryProvider<LayoutCubit>(
          create: (context) => LayoutCubit(),
        ),
        RepositoryProvider<HomeBloc>(
          create: (context) => HomeBloc(
            context.read<ProductRepository>(),
            context.read<AuthRepository>(),
            context.read<UserRepository>(),
          )..add(HomeStarted(
              userId: Supabase.instance.client.auth.currentUser?.id ?? '',
            )),
        ),
        RepositoryProvider<NotificationBloc>(
          create: (context) => NotificationBloc(
            context.read<ProductRepository>(),
            context.read<UserRepository>(),
          )..add(NotificationStarted(
              userId: Supabase.instance.client.auth.currentUser?.id ?? '',
            )),
        ),
        RepositoryProvider<ProfileBloc>(
          create: (context) => ProfileBloc(context.read<UserRepository>())
            ..add(ProfileStarted(
              context,
              name: context.read<HomeBloc>().state.user?.name ?? '',
              address: context.read<HomeBloc>().state.user?.address ?? '',
              phoneNumber: context.read<HomeBloc>().state.user?.phone ?? '',
            )),
        ),
        RepositoryProvider<DetailBloc>(create: (context) => DetailBloc()),
        RepositoryProvider<Debounce>(
          create: (context) => Debounce(milliseconds: 500),
        ),
        RepositoryProvider<CartBloc>(
          create: (context) => CartBloc(
            context.read<ProductRepository>(),
            context.read<UserRepository>(),
          )..add(CartStarted(
              userId: Supabase.instance.client.auth.currentUser?.id ?? '',
            )),
        ),
      ],
      child: MaterialApp.router(
        title: 'Nike Sneaker Store',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Provider.of<AppProvider>(context).locale,
        theme: Provider.of<AppProvider>(context).themeData,
        darkTheme: NSTheme.darkTheme,
        routerConfig: NSRoutesConfig.goRoute,
      ),
    );
  }
}
