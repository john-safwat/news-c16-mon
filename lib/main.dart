import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/provider/app_config_provider.dart';
import 'package:news_c16_mon/core/theme/app_theme.dart';
import 'package:news_c16_mon/firebase_options.dart';
import 'package:news_c16_mon/ui/home/home_screen.dart';
import 'package:news_c16_mon/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

var locale = "en";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      builder: (context, child) {
        var provider = Provider.of<AppConfigProvider>(context);
        locale = provider.locale;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(provider.locale),
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
          },
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
