import 'package:flutter/material.dart';
import 'package:newshttp/shared/app_theme.dart';
import 'package:newshttp/home_screen.dart';
import 'package:newshttp/news/view/widgets/news_detials.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newshttp/provider/setting_provider.dart';
import 'package:newshttp/splash/splash.dart';
import 'package:provider/provider.dart';
void main() {
  runApp( ChangeNotifierProvider(create: (BuildContext context) =>
      SettingProvider(),
  child: NewsApp()));
}
class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: [
        AppLocalizations.delegate,

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    //  localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale:   Locale(settingProvider.language),
      routes: {
        HomePage.routeName:(_)=>HomePage(),

        NewsDetials.routeName:(_)=>NewsDetials(),
        SplashScreen.routeName:(_)=>SplashScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

