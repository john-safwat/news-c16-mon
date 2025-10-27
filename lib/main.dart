import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/provider/app_config_provider.dart';
import 'package:news_c16_mon/core/theme/app_theme.dart';
import 'package:news_c16_mon/ui/home/home_screen.dart';
import 'package:news_c16_mon/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppConfigProvider(),
      builder: (context, child) {
        var provider = Provider.of<AppConfigProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: provider.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            HomeScreen.routeName : (context) => HomeScreen()
          },
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
