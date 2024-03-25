import 'package:flutter/material.dart';
import 'package:islami/layout/home_screen.dart';
import 'package:islami/provider/app_provider.dart';
import 'package:islami/models/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/tabs/hadeth/hadeth_content.dart';
import 'package:islami/tabs/quran/sura_content.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => MyAppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late MyAppProvider provider;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getPreferences();
    provider = Provider.of<MyAppProvider>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyThemeData.lightTheme,
        darkTheme: MyThemeData.darkTheme,
        themeMode: provider.themeMode,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.language),
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (c) => const HomeScreen(),
          SuraContent.routeName: (c) => const SuraContent(),
          HadethContent.routeName: (c) => const HadethContent(),
          SebhaTab.routeName: (c) => SebhaTab(),
        });
  }

  void getPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString('language');
    provider.changeLanguage(language!);
    if (prefs.getString('theme') == 'dark') {
      provider.changeTheme(ThemeMode.dark);
    } else if (prefs.getString('theme') == 'system') {
      provider.changeTheme(ThemeMode.system);
    } else {
      provider.changeTheme(ThemeMode.light);
    }
    bool? translate = prefs.getBool('translate');
    provider.suraTranslate(translate!);
  }
}
