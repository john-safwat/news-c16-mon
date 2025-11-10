import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:news_c16_mon/core/utils/context_extentions.dart';
import 'package:news_c16_mon/core/utils/padding_utils.dart';
import 'package:news_c16_mon/core/utils/white_space_utils.dart';

class NewsDrawerWidget extends StatelessWidget {
  final Function goToHome;
  const NewsDrawerWidget({required this.goToHome , super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 80),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              context.locale.newsApp,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          16.spaceVertical,
          InkWell(
            onTap: () {
              goToHome();
            },
            child: Row(
              children: [
                Icon(EvaIcons.home_outline, color: context.colors.primary),
                16.spaceHorizontal,
                Text(context.locale.goToHome, style: context.textTheme.titleLarge),
              ],
            ).withHorizontalPadding(16),
          ),
          Divider().withPadding(16),
          Row(
            children: [
              Icon(
                EvaIcons.color_palette_outline,
                color: context.colors.primary,
              ),
              16.spaceHorizontal,
              Text(context.locale.theme, style: context.textTheme.titleLarge),
            ],
          ).withHorizontalPadding(16),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1 , color: context.colors.primary)
            ),
            child: DropdownButton<ThemeMode>(
              value: context.appConfigProvider.themeMode,
              underline: SizedBox(),
              onChanged: (theme) {
                context.appConfigProvider.toggleTheme(
                  theme ?? context.appConfigProvider.themeMode,
                );
              },
              isExpanded: true,
              items: [ThemeMode.light, ThemeMode.dark]
                  .map(
                    (theme) => DropdownMenuItem<ThemeMode>(
                  value: theme,
                  child: Text(theme == ThemeMode.dark ? context.locale.dark : context.locale.light),
                ),
              )
                  .toList(),
            ),
          ),
          Divider().withPadding(16),
          Row(
            children: [
              Icon(
                IonIcons.earth,
                color: context.colors.primary,
              ),
              16.spaceHorizontal,
              Text(context.locale.locale, style: context.textTheme.titleLarge),
            ],
          ).withHorizontalPadding(16),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1 , color: context.colors.primary)
            ),
            child: DropdownButton<String>(
              value: context.appConfigProvider.locale,
              underline: SizedBox(),
              onChanged: (locale) {
                context.appConfigProvider.changeLocale(
                  locale ?? context.appConfigProvider.locale,
                );
              },
              isExpanded: true,
              items: ["ar", "en"]
                  .map(
                    (locale) => DropdownMenuItem<String>(
                  value: locale,
                  child: Text(locale == "en" ? context.locale.english : context.locale.arabic),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
