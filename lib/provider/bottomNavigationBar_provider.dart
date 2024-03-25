import 'package:flutter/material.dart';
import '../../tabs/hadeth/hadeth_tab.dart';
import '../../tabs/quran/quran_tab.dart';
import '../../tabs/radio/radio_tab.dart';
import '../../tabs/sebha/sebha_tab.dart';
import '../../tabs/settings/settings_tab.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int index = 0;
  List<Widget> tabs = [
    QuranTab(),
    const HadethTab(),
     SebhaTab(),
     RadioTab(),
    const SettingsTab()
  ];
  onTap(value){
      index = value;
      notifyListeners();
  }
}
