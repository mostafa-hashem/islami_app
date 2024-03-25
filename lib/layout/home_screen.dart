import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../provider/bottomNavigationBar_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomNavigationBarProvider(),
      builder: (context, child) {
        var provider = Provider.of<BottomNavigationBarProvider>(context);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Brightness.light == Theme.of(context).brightness
                  ? 'assets/images/light_bg.png'
                  : 'assets/images/dark_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.appTitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            body: provider.tabs[provider.index],
            bottomNavigationBar: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: Theme.of(context).primaryColor),
              child: BottomNavigationBar(
                currentIndex: provider.index,
                onTap: (value) {
                  provider.onTap(value);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage('assets/images/quran_icon.png')),
                      label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage('assets/images/hadeth_icon.png')),
                      label: AppLocalizations.of(context)!.hadeth),
                  BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage('assets/images/sebha_icon.png')),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage('assets/images/radio_icon.png')),
                      label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                      icon: const ImageIcon(
                          AssetImage("assets/images/settings.png")),
                      label: AppLocalizations.of(context)!.settings,
                      backgroundColor: Theme.of(context).primaryColor),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
