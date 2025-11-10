import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/provider/app_config_provider.dart';
import 'package:news_c16_mon/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

extension ThemeUtils on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  AppConfigProvider get appConfigProvider {
    return Provider.of<AppConfigProvider>(this , listen: false);
  }

  AppLocalizations get locale => AppLocalizations.of(this)!;
}
