import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/provider/app_config_provider.dart';
import 'package:news_c16_mon/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  "assets/images/${provider.isDarkMode ? "dark_news_logo.png" : "light_news_logo.png"}",
                ),
              ),
            ),
            Center(
              child: Image.asset(
                "assets/images/${provider.isDarkMode ? "dark_news_branding.png" : "light_news_branding.png"}",
                width: MediaQuery.sizeOf(context).width * 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
