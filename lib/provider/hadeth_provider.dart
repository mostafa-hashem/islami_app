import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/hadeth_model.dart';

class HadethProvider extends ChangeNotifier {
  List<HadethModel> hadethModel = [];

  Future<void> loadFile() async {
    String hadeth =
        await rootBundle.loadString('assets/files/hadeth/ahadeth .txt');
    List<String> all = hadeth.split('#\r\n');
    for (int i = 0; i < all.length; i++) {
      List<String> lines = all[i].split('\n');
      String title = lines[0];
      lines.removeAt(0);
      hadethModel.add(HadethModel(title: title, content: lines));
      notifyListeners();
    }
  }
}
