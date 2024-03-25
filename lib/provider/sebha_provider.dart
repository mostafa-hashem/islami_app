import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SebhaProvider extends ChangeNotifier {
  int counter = 0;
  double angle = 0;

  void initValues(int counter) {
    this.counter = counter;
    notifyListeners();
  }

  onTap() async {
    counter++;
    angle += 360 / 33;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', counter);
    notifyListeners();
  }

  reset() async {
    counter = 0;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', counter);
    notifyListeners();
  }
}
