// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rorty_flutter/app/di/injector.dart';
import 'package:rorty_flutter/app/language/app_language_provider.dart';
import 'package:rorty_flutter/app/language/language_manager.dart';
import 'package:rorty_flutter/app/theme/app_theme.dart';
import 'package:rorty_flutter/app/theme/app_theme_provider.dart';
import 'package:rorty_flutter/app/utils/constants.dart';
import 'package:rorty_flutter/presentation/characters/detail/character_detail_screen.dart';
import 'package:rorty_flutter/presentation/episodes/detail/episode_detail_screen.dart';
import 'package:rorty_flutter/presentation/home/home_screen.dart';
import 'package:rorty_flutter/presentation/locations/detail/location_detail_screen.dart';
import 'package:rorty_flutter/presentation/settings/about/about_screen.dart';
import 'package:rorty_flutter/presentation/settings/language/language_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await initializeDependencies();

  FlutterNativeSplash.removeAfter(initialization);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      EasyLocalization(
          supportedLocales: LanguageManager.instance!.supportedLocales,
          path: LANGUAGE_ASSETS_PATH,
          startLocale: LanguageManager.instance!.enLocale,
          child: RootApp()),
    );
  });
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 2));
}

class RootApp extends StatelessWidget {
  RootApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    initialLocation: HomeScreen.route,
    routes: [
      GoRoute(
        path: HomeScreen.route,
        name: HomeScreen.route,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: CharacterDetailScreen.route,
        name: CharacterDetailScreen.route,
        builder: (context, state) => CharacterDetailScreen(
            characterId: state.params['characterId'] ?? ''),
      ),
      GoRoute(
        path: EpisodeDetailScreen.route,
        name: EpisodeDetailScreen.route,
        builder: (context, state) =>
            EpisodeDetailScreen(episodeId: state.params['episodeId'] ?? ''),
      ),
      GoRoute(
        path: LocationDetailScreen.route,
        name: LocationDetailScreen.route,
        builder: (context, state) =>
            LocationDetailScreen(locationId: state.params['locationId'] ?? ''),
      ),
      GoRoute(
        path: LanguageScreen.route,
        name: LanguageScreen.route,
        builder: (context, state) => LanguageScreen(),
      ),
      GoRoute(
        path: AboutScreen.route,
        name: AboutScreen.route,
        builder: (context, state) => const AboutScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<AppThemeProvider>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppThemeProvider()),
        ],
        child: Consumer<AppThemeProvider>(
            builder: (context, AppThemeProvider themeNotifier, child) {
          return MaterialApp.router(
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            title: "Rorty",
            debugShowCheckedModeBanner: false,
            theme:
                themeNotifier.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        }));
  }
}
