import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  String language = 'en';
  bool translateOn = false;
  bool translateOff = true;

  void changeLanguage(String newLanguage) async {
    if (language == newLanguage) {
      return;
    }
    language = newLanguage;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', newLanguage);
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) async {
    if (themeMode == newTheme) {
      return;
    }
    themeMode = newTheme;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'theme',
        newTheme == ThemeMode.dark
            ? 'dark'
            : newTheme == ThemeMode.system
                ? 'system'
                : 'light');
    notifyListeners();
  }

  void suraTranslate(bool translate) async {
    if (translate) {
      translateOn = true;
      translateOff = false;
    } else if (!translate) {
      translateOff = true;
      translateOn = false;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('translate', translate);
    notifyListeners();
  }
}
